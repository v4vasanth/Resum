class Experience < ActiveRecord::Base
	belongs_to :user
	validates :company, length: { maximum: 60 }, presence: true
	validates :location, length: { maximum: 60 }, presence: true
	validates :duration, numericality: {less_than_or_equal_to: 600}, presence: true
	validates :role, length: { maximum: 20 }, presence: true
	validates :description, length: { maximum: 200 }
end
