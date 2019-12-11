class User < ApplicationRecord
  has_many :user_companies
  has_many :companies, through: :user_companies
  accepts_nested_attributes_for :user_companies, allow_destroy: true
  

  
  has_one :profile 
  accepts_nested_attributes_for :profile, allow_destroy: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']
        ['extra']['raw_info']
        user.email = datat['email'] if user.email.blank?
      end 
    end 
  end 

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end 



        
end
