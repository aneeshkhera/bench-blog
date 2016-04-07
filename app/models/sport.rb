class Sport < ActiveRecord::Base
  validates :content, presence: true, uniqueness: true
	has_many: post
end
