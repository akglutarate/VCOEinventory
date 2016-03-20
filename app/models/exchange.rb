class Exchange < ActiveRecord::Base

  belongs_to :user
  belongs_to :item
  
  def borrow(user, item)
    self.user_id = user
    self.item_id = item.id
    self.item_title = item.title
    self.active = true
    self.borrowed_time = Time.now.strftime("%B %e, %Y")
  end
  
  def return
    self.active = false
    self.return_time = Time.now.strftime("%B %e, %Y")
  end
  
end