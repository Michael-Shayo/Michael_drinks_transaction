from django.shortcuts import render,redirect
from django.contrib.auth import authenticate,logout,login
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth.models import User
from .models import *
from django.contrib.admin.views.decorators import staff_member_required
from django.shortcuts import get_object_or_404

from django.db.models import Q

from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa

from django.utils.timezone import now 

from django.db.models import Sum


import openpyxl
from openpyxl import Workbook
from .models import Transaction, Expenditure, DrinksStore







# Create your views here.
@login_required
def home(request):
    return render(request,template_name='home.html')


def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            messages.success(request, "Welcome You have  Succesful login.")
            return redirect('home')
        else:
           messages.warning(request, "Incorrect username or password.")
           return redirect('login') 
    return render(request,template_name='login.html')


@login_required
def logout_view(request):
    logout(request)
    messages.success(request, "Goodbye You have logout.")
    return redirect('login')


def registration(request):
    if request.method == 'POST':
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        username = request.POST['username']
        email = request.POST['email']
        phone = request.POST['phone']
        password = request.POST['password']
        confirm_password = request.POST['c_password']

        if password == confirm_password:
             if User.objects.filter(email=email).exists():
                messages.info(request, 'Email Is Taken !!!')
                return redirect('registration')
             elif User.objects.filter(username=username).exists():
                messages.info(request, 'Username Is Taken !!!')
                return redirect('registration')
             else:
                user = User.objects.create_user(
                username=username,
                email=email,
                password=password,
                first_name=first_name,
                last_name=last_name
                )
                Profile.objects.create(
                user=user,
                phone=phone,
                )
                messages.success(request, f"Congratulation { user.username } for making an account")
                return redirect('home')
        else:
            messages.warning(request, "Sorry password is not the same")
            return redirect('registration')
    return render(request, template_name='registration.html')


@staff_member_required
def store_status(request):
    store = DrinksStore.objects.first()
    if not store:
        store = DrinksStore.objects.create(soda_store=0, water_store=0)
    return render(request, "store_status.html", {"store": store})


@staff_member_required
def add_to_store(request):
    if request.method == "POST":
        soda_amount = int(request.POST.get("soda_amount", 0))
        water_amount = int(request.POST.get("water_amount", 0))

        Transaction.objects.create(
            user=request.user,
            transaction_type="add",
            soda_amount=soda_amount,
            water_amount=water_amount,
            status="pending",
            tripstatics=None
        )
        return redirect("store_status")

    return render(request, "add_to_store.html")


@staff_member_required
def pending_transactions(request):
    transactions = Transaction.objects.filter(status="pending")
    return render(request, "pending_transactions.html", {"transactions": transactions})


@staff_member_required
def confirm_transaction(request, transaction_id):
    transaction = get_object_or_404(Transaction, id=transaction_id)
    store = DrinksStore.objects.first()

    if request.method == "POST":
        action = request.POST.get("action")

        if action == "confirm":
            if transaction.transaction_type == "add":
                store.soda_store += transaction.soda_amount
                store.water_store += transaction.water_amount
            elif transaction.transaction_type == "take":
                store.soda_store -= transaction.soda_amount
                store.water_store -= transaction.water_amount

            store.save()
            transaction.status = "confirmed"
            transaction.confirmed_by = request.user
            transaction.save()

        elif action == "decline":
            transaction.status = "declined"
            transaction.confirmed_by = request.user
            transaction.save()

        return redirect("pending_transactions")

    context = {"transaction": transaction}
    return render(request, "confirm_transaction.html", context)



@staff_member_required
def logbook(request):
    profiles = Profile.objects.select_related('user').all()
    return render(request, 'logbook.html', {'profiles': profiles})


@login_required
def transaction_list(request):
    transactions = Transaction.objects.select_related("user", "confirmed_by").all()
    return render(request, "transaction_list.html", {"transactions": transactions})

@login_required
def request_take(request):
    if request.method == "POST":
        car_id = request.POST.get("car_id")
        trip_date = request.POST.get("trip_date")
        start = request.POST.get("start")
        destination = request.POST.get("destination")
        passenger_number = request.POST.get("passenger_number")

        return_trip_date = request.POST.get("return_trip_date")
        return_start = request.POST.get("return_start")
        return_destination = request.POST.get("return_destination")
        return_passenger_number = request.POST.get("return_passenger_number")

        soda_amount = int(request.POST.get("soda_amount", 0))
        water_amount = int(request.POST.get("water_amount", 0))
        
        store = DrinksStore.objects.first()
        

        soda_total = soda_amount* store.price_per_soda
        water_total = water_amount* store.price_per_water
        total_price = soda_total + water_total
    
        safari=Statistics.objects.create(
            trip_date=trip_date,
            car_id=car_id,
            start=start,
            destination=destination,
            passenger_number=passenger_number,
            return_trip_date=return_trip_date,
            return_start=return_start,
            return_destination=return_destination,
            return_passenger_number=return_passenger_number,
         )
        Transaction.objects.create(
            car_id=car_id,
            user=request.user,
            transaction_type="take",
            soda_amount=soda_amount,
            water_amount=water_amount,
            tripstatics=safari,
            total_price=total_price,
            
            
        )
        messages.success(request, "Congratulation your order has been placed and passanger number is stored")
        return redirect("home")

    return render(request, "request_take.html")


@login_required
def transaction_data(request, transaction_id):
    transaction = get_object_or_404(Transaction, id=transaction_id)

    # soda_total = transaction.soda_amount* 11500
    # water_total = transaction.water_amount* 5000
    # total_price = soda_total + water_total
    
    store = DrinksStore.objects.first()
        
    soda_total = transaction.soda_amount* store.price_per_soda
    water_total = transaction.water_amount* store.price_per_water
    total_price = soda_total + water_total


    context = {
        "transaction": transaction,
        "soda_total":soda_total,
        "water_total":water_total,
        "total_price":total_price,
    
    }
    return render(request, "transaction_data.html", context)


# @login_required
# def search_car_transactions(request):
#     query = request.GET.get("car_id", "").strip()
#     transactions = []

#     if query:
#         qs = Transaction.objects.filter(car_id__icontains=query,status="confirmed").select_related(
#             "tripstatics", "user", "confirmed_by"
#         )

#         if not qs.exists():
#             messages.warning(request, "No records found for this car ID.")
#         else:
#             # Compute totals for each transaction and attach to objects
#             for t in qs:
#                 # compute prices (use ints; update prices if needed)
#                 t.soda_total = t.soda_amount * 11500
#                 t.water_total = t.water_amount * 5000
#                 t.grand_total = t.soda_total + t.water_total
#                 transactions.append(t)

#     return render(request, "search_car_transactions.html", {
#         "query": query,
#         "transactions": transactions,
#     })

@login_required
def search_car_transactions(request):
    query = request.GET.get("q", "").strip()
    transactions = []

    if query:
        qs = Transaction.objects.filter(
            status="confirmed"   # Only completed transactions
        ).filter(
            Q(car_id__icontains=query) |
            Q(user__username__icontains=query) |
            Q(tripstatics__start__icontains=query) |
            Q(tripstatics__destination__icontains=query)
        ).select_related("tripstatics", "user", "confirmed_by")

        if not qs.exists():
            messages.warning(request, "No completed transactions found matching your search.")
        else:
            for t in qs:
                t.soda_total = t.soda_amount * 11500
                t.water_total = t.water_amount * 5000
                t.grand_total = t.soda_total + t.water_total
                transactions.append(t)

    return render(
        request,
        "search_car_transactions.html",
        {"query": query, "transactions": transactions},
    )
    
def download_receipt(request, transaction_id):
    transaction = get_object_or_404(Transaction, id=transaction_id)

    template_path = 'receipt.html'
    context = {'transaction': transaction}

    # Generate file name
    filename = f"{transaction.user.username}_{transaction.car_id}_{transaction.id}.pdf"

    # Render HTML
    html = get_template(template_path).render(context)

    # Create PDF
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'attachment; filename="{filename}"'

    pisa_status = pisa.CreatePDF(html, dest=response)

    if pisa_status.err:
        return HttpResponse("PDF creation failed")
    
    return response

def dailyincome_and_expenses (request):
    
    # --- Today’s date ---
    today = now().date()
    
    # all confirmed today transaction
    transactions = Transaction.objects.filter(
        created_on=today,  # filter using the Date portion
        transaction_type ="take",
        status="confirmed"
    )
    
    # --- Total soda/water sold today ---
    total_soda_sold = transactions.aggregate(total=models.Sum("soda_amount"))["total"] or 0
    total_water_sold = transactions.aggregate(total=models.Sum("water_amount"))["total"] or 0


    exp = Expenditure.objects.filter(created_on=today)
    store = DrinksStore.objects.first()
    
    soda_total = total_soda_sold* store.price_per_soda
    water_total = total_water_sold* store.price_per_water
    total_price = soda_total + water_total
    
    total_expenditure = exp.aggregate(total=Sum("value_amount"))["total"] or 0
    
    cash_amount = total_price - total_expenditure
    context = {
        "transactions": transactions,
        "total_soda_sold": total_soda_sold,
        "total_water_sold": total_water_sold,
        "total_price": total_price,
        "exp": exp,
        "store": store,
        "today": today,
        "total_expenditure": total_expenditure,
        "cash_amount": cash_amount,
    }
    
    
    # return render(request, 'income_and_expences.html', {'exp': exp,'store':store})
    return render(request, 'income_and_expences.html', context)



@login_required
def search_transaction_by_date(request):

    transactions = None
    total_soda_sold = 0
    total_water_sold = 0
    total_price = 0
    exp = None
    total_expenditure = 0
    cash_amount = 0
    date_searched = None

    store = DrinksStore.objects.first()

    if request.method == "GET" and "date" in request.GET:
        date_searched = request.GET.get("date")
        if date_searched:
            
            date_obj = timezone.datetime.strptime(date_searched, "%Y-%m-%d").date()

            # Transactions of searched day
            transactions = Transaction.objects.filter(
                created_on=date_obj,
                transaction_type="take",
                status="confirmed"
            )

            # Summaries
            from django.db.models import Sum
            total_soda_sold = transactions.aggregate(total=Sum("soda_amount"))["total"] or 0
            total_water_sold = transactions.aggregate(total=Sum("water_amount"))["total"] or 0

            exp = Expenditure.objects.filter(created_on=date_obj)
            total_expenditure = exp.aggregate(total=Sum("value_amount"))["total"] or 0

            if store:
                soda_total = total_soda_sold * store.price_per_soda
                water_total = total_water_sold * store.price_per_water
                total_price = soda_total + water_total

            cash_amount = total_price - total_expenditure

    context = {
        "transactions": transactions,
        "total_soda_sold": total_soda_sold,
        "total_water_sold": total_water_sold,
        "total_price": total_price,
        "exp": exp,
        "total_expenditure": total_expenditure,
        "cash_amount": cash_amount,
        "store": store,
        "date": date_searched,
    }

    return render(request, "search_income_expences_transaction.html", context)

# The openpyxl should be imported above its view

import openpyxl
def daily_report_excel(request):
    today = timezone.now().date()

    # Get today's data
    transactions = Transaction.objects.filter(
        created_on=today,
        transaction_type="take",
        status="confirmed"
    )

    exp = Expenditure.objects.filter(created_on=today)
    store = DrinksStore.objects.first()

    total_soda = transactions.aggregate(total=Sum("soda_amount"))["total"] or 0
    total_water = transactions.aggregate(total=Sum("water_amount"))["total"] or 0
    total_expenditure = exp.aggregate(total=Sum("value_amount"))["total"] or 0

    soda_total = total_soda * store.price_per_soda
    water_total = total_water * store.price_per_water
    total_price = soda_total + water_total

    cash_amount = total_price - total_expenditure

    # Create Excel file
    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = "Daily Report"

    # ---- Writing DATA ----
    ws.append(["DAILY REPORT", str(today)])
    ws.append([])

    ws.append(["Total Soda Sold", total_soda])
    ws.append(["Total Water Sold", total_water])
    ws.append(["Collected Cash (TZS)", total_price])
    ws.append(["Total Expenditure (TZS)", total_expenditure])
    ws.append(["Cash Amount", cash_amount])

    ws.append([])
    ws.append(["TRANSACTIONS"])
    ws.append(["User", "Soda", "Water", "Car", "Time"])

    for t in transactions:
        ws.append([
            t.user.username,
            t.soda_amount,
            t.water_amount,
            t.car_id,
            t.created_at.strftime("%H:%M")
        ])

    ws.append([])
    ws.append(["EXPENDITURE"])
    ws.append(["Type", "Info", "Value", "Approved By", "Date"])

    for e in exp:
        ws.append([
            e.expend_type,
            e.info,
            e.value_amount,
            e.approved_by,
            str(e.created_on)
        ])

    # ---- Send file to browser ----
    response = HttpResponse(
        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    )
    filename = f"Daily_Report_{today}.xlsx"
    response["Content-Disposition"] = f'attachment; filename="{filename}"'

    wb.save(response)
    return response

def cashier_report(request):
    grouped_data ={}
    
    start_date = request.GET.get("start")
    end_date = request.GET.get("end")
    
    
    
    if start_date and end_date:

        # Query transactions in range
        qs = Transaction.objects.filter(
            created_on__range=[start_date, end_date],
            status="confirmed",            # Optional but recommended
            transaction_type="take"        # Only "take" transactions
        ).select_related("tripstatics","user","confirmed_by").order_by("created_on")

        # Group by created_on date
        for t in qs:
            day = t.created_on
            if day not in grouped_data:
                grouped_data[day] = []
            grouped_data[day].append(t)

    return render(request, "cashier_report.html", {
        "grouped_data": grouped_data,
        "start": start_date,
        "end": end_date,
    })
    
    
    
def expenditure_record(request):
    if request.method == "POST":
        expenditure_type = request.POST.get("type")
        info = request.POST.get("info")
        value_amount = request.POST.get("amount")
    
    
        expenditure = Expenditure.objects.create(
         expend_type = expenditure_type,
         info = info,
         value_amount = value_amount,
         )
        
        messages.success(request, "Congratulation your Record has been added in the report")
        return redirect("home")

    return render(request, "expenditure.html")
    
    
    
    
    
    
    
    