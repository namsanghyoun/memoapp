class Memo < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :content, presence: true, length: { minimum: 2, maximum: 1000 }
  validates :user_id, presence: true
end