class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :basic
  has_many :educations
  has_many :experiences
  has_many :projects
  has_many :skills

  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
end

