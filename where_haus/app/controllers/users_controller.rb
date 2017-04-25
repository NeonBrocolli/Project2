class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Signed up!"
      redirect_to root_path
    else
      render :new
    end
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  # end

private

  def user_params
    params.require(:user).permit(:firstname, :email, :company, :password, :password_confirmation)

  end
end
