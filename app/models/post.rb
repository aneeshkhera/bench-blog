class Post < ActiveRecord::Base
  validates :content, presence: true, uniqueness: true
	belongs_to :user
	belongs_to :sport
	has_many :comment
end
