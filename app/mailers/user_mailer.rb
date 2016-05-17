class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
	default :from => "VCOE Inventory <vcoe.inventory@gmail.com>"
	default :to => "VCOE Inventory <vcoe.inventory@gmail.com>"
	
	def password_reset(user)
		@user = user
		mail :to => user.email, :subject => 'VCOE Inventory - Password Reset'
  end
	
	def new_message(message)
		@message = message
		mail subject: "VCOE Inventory - Message from #{message.name}"
	end
	
	def return_confirm(item, user)
		@item = item
		mail :to => user, :subject => "VCOE Inventory - #{item.title} has been returned."
	end
	
	def item_request
		
	end
end
