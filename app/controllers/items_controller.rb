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
  end

  def destroy
    @item.destroy
    flash[:success] = "#{@item.title} has been deleted."
    redirect_to items_path
  end
  
  def borrow
    @exchange = Exchange.new(exchange_params)
    @exchange.borrower = current_user
    @exchange.item_id = Item.find(params[:id])
    if @exchange.save
      flash[:success] = 'You are now borrowing the item.'
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
      params.require(:exchange).permit(:borrower, :item_id)
    end
    
    def require_same_user
      if current_user != @item.user && !current_user.admin?
        flash[:danger] = 'You can only edit your own account.'
        redirect_to root_path
      end
    end
end