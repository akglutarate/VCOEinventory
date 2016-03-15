class ItemsController < ApplicationController
    
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
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
           flash[:success] = "You have successfully update #{@item.title}."
           redirect_to item_path(@item)
        else
            render 'edit'
        end
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    
    private
        def item_params
            params.require(:item).permit(:title, :owner_location)
        end
end