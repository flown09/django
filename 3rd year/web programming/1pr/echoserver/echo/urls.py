from django.urls import path

from .views import (homePageView, book_list, book_create, book_edit,
                    register_view, login_view, logout_view, book_delete,
                    book_list, profile, cart, add_to_cart, checkout, orders)

urlpatterns = [
    path('home/', homePageView, name='home'),
    path('', book_list, name='book_list'),
    path('add/', book_create, name='book_create'),
    path('edit/<int:pk>/', book_edit, name='book_edit'),
    path('delete/<int:pk>/', book_delete, name='book_delete'),
    path('register/', register_view, name='register'),
    path('login/', login_view, name='login'),
    path('logout/', logout_view, name='logout'),
    path('profile/', profile, name='profile'),
    path('cart/', cart, name='cart'),
    path('add_to_cart/<int:book_id>/', add_to_cart, name='add_to_cart'),
    path('checkout/', checkout, name='checkout'),
    path('orders/', orders, name='orders'),
]