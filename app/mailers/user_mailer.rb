class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
	default :from => "#{current_user.username} <#{current_user.email}>"
	default :to => "VCOE Inventory <vcoe.inventory@gmail.com>"
	
	def password_reset(user)
		@user = user
		mail :to => user.email, :subject => 'VCOE Inventory Password Reset'
  end
	
	def new_message(message)
		@message = message
		mail subject: "Message from #{message.name}"
	end
end
