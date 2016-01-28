class Basic < ActiveRecord::Base
	belongs_to :user
	validates :full_name, length: { maximum: 60 }, presence: true
	validates_format_of :phone, with: /\A\d{10}\Z/, message: 'fuck you'
end
