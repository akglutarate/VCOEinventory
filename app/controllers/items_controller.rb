class ItemsController < ApplicationController
    
    before_action :set_item, only: [:edit, :update, :show, :destroy]
    
    
    def index
        @items = Item.all
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
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
        flash[:success] = 'The item has been deleted.'
        redirect_to items_path
    end
    
    
    private
        def set_item
            @item = Item.find(params[:id])
        end
    
        def item_params
            params.require(:item).permit(:title, :owner_location)
        end
end