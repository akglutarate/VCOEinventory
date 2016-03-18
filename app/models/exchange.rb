class Exchange < ActiveRecord::Base

  belongs_to :user
  belongs_to :item
  
  def borrow(user, item)
    self.user_id = user
    self.item_id = item
    self.active = true
    self.borrowed_time = Time.now.strftime("%B %e, %Y at %I:%M %p")
  end
  
  def return
    self.active = false
    self.return_time = Time.now.strftime("%B %e, %Y at %I:%M %p")
  end
  
end