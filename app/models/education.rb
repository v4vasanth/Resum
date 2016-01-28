class Education < ActiveRecord::Base
	belongs_to :user
	validates :degree, length: { in: 2..15 }
	validates :college, length: { maximum: 60 }
	validates :location, length: { maximum: 60 }
	validates :year_of_grad, length: { is: 4 }
	validates :gpa, numericality: {less_than_or_equal_to: 10}
end
