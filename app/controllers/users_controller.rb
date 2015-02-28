class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      puts @user.errors.inspect
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, profile_attributes: profile_params)
  end

  def profile_params
    [:nickname, :bio, :phone, :dob]
  end

end
