class Experience < ActiveRecord::Base
	belongs_to :user
	validates :company, length: { maximum: 60 }
	validates :location, length: { maximum: 60 }
	validates :duration, numericality: {less_than_or_equal_to: 600}
	validates :role, length: { maximum: 20 }
end
