class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  has_one :basic
  has_many :educations
  has_many :experiences
  has_many :projects
  has_many :skills

  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(
          username: data["name"],
          email: data["email"],
          password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end

