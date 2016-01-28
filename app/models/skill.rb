class Skill < ActiveRecord::Base
	belongs_to :user
	validates :skill, length: { maximum: 20 }, presence: true
end
