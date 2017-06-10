class Post < ApplicationRecord
  belongs_to :user
  self.per_page = 10
  default_scope ->{ order('created_at') }

  validates :title, presence: true
end