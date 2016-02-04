class Basic < ActiveRecord::Base
	belongs_to :user
	validates :full_name, length: { maximum: 60 }, presence: true
	validates_format_of :phone, with: /\A\d{10}\Z/, message: 'fuck you'
	validates_format_of :linkedin, with: URI.regexp(%w(http https)), message: I18n.t('errors.URL') , allow_blank: true
  	validates_format_of :linkedin, with: /\A((\S)+linkedin(\S)+)\Z/i, message: I18n.t('errors.URLsite',v:"Linkedin") , allow_blank: true
end
