class Item < ActiveRecord::Base
    
  belongs_to :user
  belongs_to :school
  has_many :exchanges
  
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :owner_location, :presence => {:message => 'Please select a school.'}
  validates :user_id, presence: true
  
  
  def self.search(search, filter)
    if search
      self.where('title ILIKE ?', "%#{search}%")
    elsif filter
      self.where('owner_location ILIKE ?', "%#{filter}%")
    else
      self.all
    end
  end
  
end