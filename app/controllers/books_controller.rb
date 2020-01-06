class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def index
    @books = Book.all
    @book_new = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
    redirect_to book_path(book.id),alert: 'You have creatad book successfully.'
  else
    flash[:notice] = "error"
    @book_new = book
    @books = Book.all
    @user = current_user
    render :index
  end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
      end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book),notice: 'You have updated book successfully.'
    else
    flash[:notice] = "error"
    render :edit
  end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private
  def user_params
  	params.require(:user).prermit(:name, :introduction, :profile_image_id)
  end

  def book_params
    params.require(:book).permit(:title,:body,:user_id)
  end
end