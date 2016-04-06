#class Protocol < ActiveRecord::Base
#
#	has_many :items
#  
#	def self.set(protocols, item)
#		if protocols.exists?(item.title)
#			protocols.name.amount += 1
#		else
#			Protocol.new(:name => item, :amount => 1) 
#		end
#		item.protocol_id = protocols.where(:name => item.title)
#	end
# 
#end