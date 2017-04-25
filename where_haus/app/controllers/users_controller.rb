class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Signed up!"
      redirect_to users_path
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
