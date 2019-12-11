class Company < ApplicationRecord
    has_many :user_companies
    has_many :users, through: :user_companies
    has_many :reviews, dependent: :destroy
    accepts_nested_attributes_for :reviews
   
    validates :name, presence: true, uniqueness: true
    validates :headquarters, presence: true
    validates :industry, presence: true 
    validates :revenue, presence: true 
    validates :mission_motto_ideal, presence: true 
    validates :website, uniqueness: true 
    
end
