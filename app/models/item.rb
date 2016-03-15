class Item < ActiveRecord::Base
    
    belongs_to :user
    
    validates :title, presence: true, length: { minimum: 3, maximum: 20 }
    validates :owner_location, presence: true, length: { minimum: 3, maximum: 20 }
    
end