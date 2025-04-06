from django.http import HttpResponse
from .models import Book
from django.shortcuts import render, get_object_or_404, redirect
from django.core.paginator import Paginator
from .forms import BookForm

def homePageView(request):
    return HttpResponse('Hello, World!')

def book_list(request):
    # books = Book.objects.all()
    # return render(request, 'book_list.html', {'books': books})
    books = Book.objects.all()
    paginator = Paginator(books, 5)  # 5 книг на страницу
    page = request.GET.get('page')
    books = paginator.get_page(page)
    return render(request, 'book_list.html', {'books': books})

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
    book.delete()
    return redirect('book_list')