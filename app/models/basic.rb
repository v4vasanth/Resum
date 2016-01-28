class Basic < ActiveRecord::Base
	belongs_to :user
	validates :full_name, length: { maximum: 60 }
	validates :phone, length: { is: 10 }
end
