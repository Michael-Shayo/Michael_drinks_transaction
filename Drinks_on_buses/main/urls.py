from django.urls import path
from. import views

urlpatterns = [
    path('',views.home, name='home'),
    path('login/',views.login_view,name='login'),
    path('logout/',views.logout_view, name='logout'),
    path('register/',views.registration,name='registration'),
    path('logbook/',views.logbook, name='logbook'),
    path('store_status/', views.store_status, name='store_status'),
    path('add_to_store/', views.add_to_store, name='add_to_store'),
    path('pending_transactions/', views.pending_transactions, name='pending_transactions'),
    path('confirm_transaction/<int:transaction_id>/', views.confirm_transaction, name='confirm_transaction'),
    path("transactions/", views.transaction_list, name="transaction_list"),
    path('request_take/', views.request_take, name='request_take'),
    path('transaction_data/<int:transaction_id>/', views.transaction_data, name='transaction_data'),
    path("search_car/", views.search_car_transactions, name="search_car_transactions"),
    path("download_receipt/<int:transaction_id>/", views.download_receipt, name="download_receipt"),
    path("daily_report",views.dailyincome_and_expenses,name="daily_report"),
    path("search_transaction",views.search_transaction_by_date,name="searchtransaction"),
     path("daily_report/", views.daily_report_excel, name="daily_report"),
] 