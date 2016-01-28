class Project < ActiveRecord::Base
	belongs_to :user
	validates :title, length: { maximum: 60 }, presence: true
end
