class Item < ActiveRecord::Base
    
  belongs_to :user
  belongs_to :school
  belongs_to :protocol
  has_many :exchanges
  
  validates :title, presence: true, length: { minimum: 3, maximum: 40 }
  validates :owner_location, :presence => { :message => 'Please select a school.' }
	validates :category, :presence => { :message => 'Please select a category.' }
  validates :user_id, presence: true
  
  last_protocol = ''
  
	def self.search(search, filter, category)
    if search
      self.where('title like ?', "%#{search}%")
    elsif filter
      self.where('owner_location like ?', "%#{filter}%")
		elsif category
			self.where('category like ?', "%#{category}%")
    else
      self.all
    end
  end
  
	
  #def reload_protocol(title)
  #  Protocol.where(:name => title).first_or_create!
  #  self.protocol_id = Protocol.find_by(:name => title).id
  #end

end