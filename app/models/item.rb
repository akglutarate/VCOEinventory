class Item < ActiveRecord::Base
    
  belongs_to :user
  has_many :exchanges
  
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :owner_location, presence: true, length: { minimum: 3, maximum: 50 }
  validates :user_id, presence: true
  
end