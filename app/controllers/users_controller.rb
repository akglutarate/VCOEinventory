class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, #{@user.username}, your profile was successfully created."
      redirect_to user_path(@user)
    else
      render 'new'
    end
    
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'You have successfully updated your profile.'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  
end