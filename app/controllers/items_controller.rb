class ItemsController < ApplicationController
    
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
     flash[:success] = 'You have successfully created a new item.'
     redirect_to item_path(@item)
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
     flash[:success] = "You have successfully updated #{@item.title}."
     redirect_to item_path(@item)
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.all
    @exchanges = Exchange.where(item_id: @item)
  end

  def destroy
    @item.destroy
    flash[:success] = "#{@item.title} has been deleted."
    redirect_to items_path
  end

  
  def borrow
    @item = Item.find(params[:item_id])
    @exchange = Exchange.new
    @exchange.user_id = current_user.id
    @exchange.lender = @item.user.id
    @exchange.item_id = @item.id
    @exchange.active = true
    @exchange.borrowed_time = Time.now.strftime("%B %e, %Y at %I:%M %p")
    if @exchange.save
      flash[:success] = "You are now borrowing #{@item.title}."
      redirect_to item_path(@item)
    else
      render 'show'
    end
  end

  def return
    @item = Item.find(params[:item_id])
    @exchange = @item.exchanges.last
    @exchange.active = false
    @exchange.return_time = Time.now.strftime("%B %e, %Y at %I:%M %p")
    if @exchange.save
      flash[:success] = "You have returned #{@item.title}."
      redirect_to item_path(@item)
    else
      render 'show'
    end
  end



  private
    def set_item
      @item = Item.find(params[:id])
    end
  
    def item_params
      params.require(:item).permit(:title, :owner_location)
    end
    
    def exchange_params
      params.require(:exchange).permit(:item_id, :active)
    end
    
    def require_same_user
      if current_user != @item.user && !current_user.admin?
        flash[:danger] = 'You can only edit your own account.'
        redirect_to root_path
      end
    end
end
