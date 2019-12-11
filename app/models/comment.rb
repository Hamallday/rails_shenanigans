class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  validates_presence_of :content
end
