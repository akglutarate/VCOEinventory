class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]
  
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
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
    if @user.update(user_params)
      flash[:success] = 'You have successfully updated your profile.'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  
  def show
    @items = @user.items.paginate(page: params[:page], per_page: 4).order('title ASC')
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
      params.require(:user).permit(:username, :email, :password)
    end
    
    
    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:danger] = 'You can only edit your own account.'
        redirect_to root_path
      end
    end
    
    
    def require_admin
      if logged_in? && !current_user.admin? 
        flash[:danger] = 'Only an admin can perform that action.'
        redirect_to root_path
      end
    end
end