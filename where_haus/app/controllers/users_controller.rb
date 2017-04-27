class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Signed up!"
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
      @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User deleted.' }
      format.json { head :no_content }
    end
  end

private

  def user_params
    params.require(:user).permit(:firstname, :email, :company, :password, :password_confirmation)
  end
end
