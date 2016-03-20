class SchoolsController < ApplicationController
   
   before_action :set_school, only: [:edit, :update, :destroy]
   before_action :require_admin
   
   def index
     @schools = School.all
   end
    
  def new
    @school = School.new
  end
  
  def create
    @school = School.new(school_params)
    if @school.save
      flash[:success] = 'You have successfully added a new school.'
      redirect_to schools_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @school.update(school_params)
      flash[:success] = "You have successfully updated #{@school.name}"
      redirect_to schools_path
    else
      render 'edit'
    end
    
  end
  
  def destroy
    deleted_school = @school.name
    @school.destroy
    flash[:success] = "You have successfully deleted #{deleted_school}"
    redirect_to schools_path
  end



  private
    def school_params
      params.require(:school).permit(:name)
    end
    
    def set_school
      @school = School.find(params[:id])
    end
    
    def require_admin
      if logged_in? && !current_user.admin? 
        flash[:danger] = 'Only an admin can perform that action.'
        redirect_to root_path
      end
    end

end
