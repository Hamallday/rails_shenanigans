class Review < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :thanks, dependent: :destroy
  has_many :comments, dependent: :destroy 
  accepts_nested_attributes_for :comments

  validates_presence_of :title
  validates_inclusion_of :rating, :in => 1..5

end
