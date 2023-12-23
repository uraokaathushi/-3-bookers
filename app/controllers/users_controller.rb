class UsersController < ApplicationController

   def show
    @user = User.find(current_user.id)
    @books = @user.book
    @book = Book.find_by(params[:id])
    @users = User.all
  end

  def index
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  unless @user.id == current_user.id
    redirect_to user_path(current_user.id)
  end
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
        @user.reload
     flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
  else
    render :edit
  end
end

    private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_id, :profile_image)
  end

   def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end
