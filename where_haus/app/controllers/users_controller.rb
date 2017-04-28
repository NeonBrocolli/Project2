class UsersController < ApplicationController
  before_action :authorize, only:[:show, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Signed up!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to root_path
    else
      @user = current_user
      render :edit
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :company, :password, :password_confirmation)
  end
end
