class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(params[:id])
     if @user.update(user_params)
    redirect_to user_path(@user), notice: "User was successfully updated."
  else
    render :edit
  end
end

    private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_id)
  end
end
