class Education < ActiveRecord::Base
	belongs_to :user
	validates :degree, length: { in: 2..15 }, presence: true
	validates :college, length: { maximum: 60 }, presence: true
	validates :location, length: { maximum: 60 }, presence: true
	validates :year_of_grad, length: { is: 4 }, presence: true
	validates :gpa, numericality: {less_than_or_equal_to: 10}, presence: true
end
