from django.http import HttpResponse
from .models import Book, Cart, Order, OrderItem
from django.shortcuts import render, get_object_or_404, redirect
from django.core.paginator import Paginator
from .forms import BookForm, CustomUserCreationForm, CustomAuthenticationForm, UserUpdateForm
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib import messages

@login_required
def orders(request):
    orders = Order.objects.filter(user=request.user).order_by('-created_at')
    return render(request, 'orders.html', {'orders': orders})

@login_required
def checkout(request):
    cart_items = Cart.objects.filter(user=request.user)
    if not cart_items:
        return redirect('cart')

    total = sum(item.book.price * item.quantity for item in cart_items)
    order = Order.objects.create(user=request.user, total=total)

    for item in cart_items:
        OrderItem.objects.create(order=order, book=item.book, quantity=item.quantity)

    cart_items.delete()
    return redirect('orders')


@login_required
def cart(request):
    items = Cart.objects.filter(user=request.user)
    total = sum(item.book.price * item.quantity for item in items)
    return render(request, 'cart.html', {'items': items, 'total': total})

@login_required
def add_to_cart(request, book_id):
    book = get_object_or_404(Book, pk=book_id)
    cart_item, created = Cart.objects.get_or_create(user=request.user, book=book)
    if not created:
        cart_item.quantity += 1
        cart_item.save()
    return redirect(request.META.get('HTTP_REFERER', 'book_list'))

@login_required
def profile(request):
    if request.method == 'POST':
        form = UserUpdateForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('profile')
    else:
        form = UserUpdateForm(instance=request.user)
    return render(request, 'profile.html', {'form': form})

def register_view(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('book_list')
    else:
        form = CustomUserCreationForm()
    return render(request, 'register.html', {'form': form})

def login_view(request):
    if request.method == 'POST':
        form = CustomAuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('book_list')
    else:
        form = CustomAuthenticationForm()
    return render(request, 'login.html', {'form': form})

def logout_view(request):
    logout(request)
    return redirect('book_list')

def homePageView(request):
    return HttpResponse('Hello, World!')

def is_user_or_admin(user):
    return user.is_authenticated and (user.role == 'user' or user.role == 'admin')

def book_list(request):
    books = Book.objects.all()
    paginator = Paginator(books, 5)
    page = request.GET.get('page')
    books = paginator.get_page(page)
    return render(request, 'book_list.html', {'books': books})

@user_passes_test(is_user_or_admin)
def book_create(request):
    if request.method == 'POST':
        form = BookForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('book_list')
    else:
        form = BookForm()
    return render(request, 'book_form.html', {'form': form})


def book_edit(request, pk):
    book = get_object_or_404(Book, pk=pk)

    if not request.user.role == 'admin':
        messages.error(request, "У вас нет прав для редактирования этой книги.")
        return redirect('book_list')

    if request.method == 'POST':
        form = BookForm(request.POST, instance=book)
        if form.is_valid():
            form.save()
            return redirect('book_list')
    else:
        form = BookForm(instance=book)
    return render(request, 'book_form.html', {'form': form})


def book_delete(request, pk):
    book = get_object_or_404(Book, pk=pk)

    if not request.user.role == 'admin':
        messages.error(request, "У вас нет прав для удаления этой книги.")
        return redirect('book_list')

    book.delete()
    return redirect('book_list')