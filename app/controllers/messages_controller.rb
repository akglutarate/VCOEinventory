class MessagesController < ApplicationController
  
	def new
		@message = Message.new
  end

	
  def create
		@message = Message.new(message_params)
		
		if @message.valid?
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
