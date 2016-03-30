class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]
  
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5).order('username ASC')
  end
  
  
  def new
    @user = User.new
  end
  
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.username}, your profile was successfully created."
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  
  def edit
  end
  
  
  def update
		new_params = user_params.delete_blanks!
		if @user.update_attributes(new_params)
      flash[:success] = 'You have successfully updated your profile.'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  
  def show
    @items = @user.items.paginate(page: params[:page], per_page: 5).order('title ASC')
    @exchanges = Exchange.where(user_id: @user, active: true)
  end
  
  
  def destroy
    deleted_user = @user.username
    @user.destroy
    flash[:danger] = "#{deleted_user} and all #{deleted_user}'s articles have been deleted."
    redirect_to users_path
  end
  
  
  
  private
    def set_user
      @user = User.find(params[:id])
    end
    
    
    def user_params
			params.require(:user).permit(:username, :email, :location, :password, :password_confirmation)
    end
   
end