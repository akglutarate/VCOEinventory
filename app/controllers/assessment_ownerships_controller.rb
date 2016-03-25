class AssessmentOwnershipsController < ApplicationController
  
	
  def index
		@users = User.all
		@schools = School.all
  end
  
	def update
		@items = Item.where(:owner_location => params[:ownership_school])
		@items.update_all(:user_id => params[:ownership_user])
		flash[:success] = "Ownership change was successful."
		redirect_to assessment_ownership_path
	end

end