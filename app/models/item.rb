class Item < ActiveRecord::Base
    
  belongs_to :user
  has_many :exchanges
  
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :owner_location, presence: true, length: { minimum: 3, maximum: 50 }
  validates :user_id, presence: true
  
  
  def self.search(search)
    if search
      self.where('title LIKE ?', "%#{search}%")
    else
      self.all
    end
  end
  
end