class Protocol < ActiveRecord::Base

	has_many :items
  
  validates :amount, presence: true
  
end