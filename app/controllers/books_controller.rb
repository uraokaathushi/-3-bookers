class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
    @users = User.all
  end

  def update
    @user = User.find_by(params[:id])
     if @user.update(user_params)
    redirect_to user_path(@user), notice: "User was successfully updated."
  else
    render :edit
  end
end

  def show

  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id, :image)
  end

end

