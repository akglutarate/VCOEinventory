class ActivitiesController < ApplicationController
	
	before_action :set_exchanges
	
  def index
  end
  
	def report
		report = [ (params[:view_by] || "") + "\n", 
			"Report generated on " + Time.zone.now.to_s + "\n", 
							"-----------------------------------------\n\n" ]
		
		@exchanges.each do |exchange|
			report.push("** " + exchange.item_title + " **\n")
			report.push("Borrowed: " + exchange.borrowed_time + ", " + exchange.user.username + "\n")
			report.push("Returned: " + (exchange.return_time || "___________") + "\n\n")
		end
		send_data report.join(''), :filename => 'report.txt'
	end
	
	
	private
	
		def set_exchanges
			if params[:view_by] == 'pending_return'
				@exchanges = Exchange.where(active: true).order('item_title ASC')
			else
				@exchanges = Exchange.all.order('item_title ASC, id ASC')
			end
		end
end
