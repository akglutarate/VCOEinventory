class MessagesController < ApplicationController
  
	before_action :require_user
	
	
	def new
		@wish = Wish.new
  end

	
  def create
		@wish = Wish.new(wish_params)
		
		if @wish.valid?
			UserMailer.new_message(@message).deliver_now
			redirect_to root_path, notice: 'Thank you for your message. You will be contacted soon!'
		else
			flash[:alert] = 'An error has occurred while delivering this message.'
			render 'new'
		end
  end
	
	
	
	private
	
	def message_params
		params.require(:message).permit(:name, :email, :content)
	end
	
end
