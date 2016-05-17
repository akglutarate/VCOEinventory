class ProtocolsController < ApplicationController
  
	
  def index
    @protocols = Protocol.paginate(page: params[:page], per_page: 10).order('name ASC')
    @schools = School.all
  end
  
  def show
    @protocol = Protocol.find(params[:id])
  end
  

  def add
    @protocol = Protocol.find(params[:protocol_id])
    @instance = Instance.new(instance_params) 
    
    @protocol.amount = params[:amount]
    
    if @protocol.save
      redirect_to protocol_path(@protocol)
    else
      flash[:error] = "Please enter a number for the amount of protocols."
      redirect_to protocol_path(@protocol)
    end
	end
  
  private
    def instance_params
      params.require(:instance).permit(:protocol_id, :user_id, :amount)
    end 
end