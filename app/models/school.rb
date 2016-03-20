class School < ActiveRecord::Base
  
  has_many :items
  
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
    
end