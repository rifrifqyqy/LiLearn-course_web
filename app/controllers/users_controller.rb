class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password_confirmation = params[:user][:password_confirmation] # Setel password_confirmation
    if @user.save
      redirect_to login_path, notice: 'User created successfully. Please log in.'
    else
      flash.now[:alert] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
