class ActivitiesController < ApplicationController
   
  def index
    if params[:view_by] == 'pending_return'
      @exchanges = Exchange.where(active: true).order('item_title ASC')
    else
      @exchanges = Exchange.all.order('item_title ASC, id ASC')
    end
  end
  


end
