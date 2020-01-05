class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    @users = User.all
    @user = current_user
    @book_new = Book.new
  end

  def show
    @book_new = Book.new
  	@user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if  @user.update(user_params)
    redirect_to user_path(@user),notice: 'You have updated user successfully.'
  else
    render 'edit'
  end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title,:body,:user_id)
  end
end
