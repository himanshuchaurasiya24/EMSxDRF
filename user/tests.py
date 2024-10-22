from django.test import TestCase
from datetime import datetime
# Create your tests here.
now_str = str(datetime.now())
print(now_str)
date_string = now_str
print(date_string)
date_object = datetime.strptime(date_string, "%Y-%m-%d %H:%M:%S.%f")
print("Converted DateTime:", date_object)
print("Year:", date_object.year)
print("Month:", date_object.month)
print("Day:", date_object.day)
print("Hour:", date_object.hour)
print("Minute:", date_object.minute)
print("Second:", date_object.second)
print("Micro Second:", date_object.microsecond)