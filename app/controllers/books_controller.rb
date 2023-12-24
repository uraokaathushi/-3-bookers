class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit,:update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    @user = current_user
  if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
   else
    render :index
   end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
    @users = User.all
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

   def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to book_path(@book)
    end
  end

  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book)
  else
    render :edit
  end
end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user
    @users = User.all
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id, :profile_image)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    @user = @book.user
  unless @user == current_user
      redirect_to books_path
  end
  end

end

