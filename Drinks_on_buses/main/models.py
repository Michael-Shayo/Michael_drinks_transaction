from django.db import models
from django.utils import timezone 
from django.contrib.auth.models import User

# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    phone = models.CharField(max_length=20)
    def __str__(self):
        return self.user.username

class DrinksStore(models.Model):  
    soda_store = models.IntegerField(default=0)
    water_store = models.IntegerField(default=0)
    price_per_soda = models.IntegerField(default=11500)
    price_per_water = models.IntegerField(default=5000)
    def __str__(self):
        return f"SODA:{self.soda_store}, WATER: {self.water_store}"
    

class Statistics(models.Model):
    trip_date = models.DateField()
    car_id = models.CharField(max_length=10, default="T 884DEE")
    start = models.CharField(max_length=255)
    destination = models.CharField(max_length=255)
    passenger_number = models.IntegerField()

    return_trip_date = models.DateField()
    return_start = models.CharField(max_length=255, default="none")
    return_destination = models.CharField(max_length=255, default="none")
    return_passenger_number = models.IntegerField(default=0)

    def __str__(self):
        return f"Trip: {self.start} to {self.destination} | return {self.return_start} to {self.return_destination}"

TRANSACTION_TYPES = (
    ("add", "Add"),
    ("take", "Take"),
)

STATUS_TYPES = (
    ("pending", "Pending"),
    ("confirmed", "Confirmed"),
    ("declined", "Declined"),
)

class Transaction(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    car_id = models.CharField(max_length=10, default="T 884DEE")
    tripstatics = models.ForeignKey(Statistics, on_delete=models.CASCADE, related_name="transactions",null=True,blank=True)
    transaction_type = models.CharField(max_length=10, choices=TRANSACTION_TYPES)
    soda_amount = models.IntegerField(default=0)
    water_amount = models.IntegerField(default=0)
    total_price = models.IntegerField(default=0)
    status = models.CharField(max_length=10, choices=STATUS_TYPES, default="pending")
    created_at = models.TimeField(auto_now_add=True)
    created_on = models.DateField(default=timezone.now)
    confirmed_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL, related_name="confirmed_transactions")

    def __str__(self):
        return f" TRANSACTION MADE BY {self.user.username} STATUS = {self.status}"

EXPENDITURE_TYPES = (
    ("office","office"),
    ("payments", "Payments"),
    ("food_allowance", "Food_allowance"),
    ("other_activity", "Other_activity"),
)

class Expenditure(models.Model):
    
    expend_type = models.CharField(max_length=100, choices=EXPENDITURE_TYPES,default="none ")
    info = models.TextField(max_length=2000)
    value_amount = models.IntegerField(default="000")
    approved_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE)
    # created_on = models.DateField(auto_now_add=True)
    created_on = models.DateField(default=timezone.now) #this take te actual time on the time zone
    
    def __str__(self):
        return f"{self.expend_type},Amount : {self.value_amount}"

