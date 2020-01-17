class Card < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  validates :name, presence: true
  validates :user_id, presence: true
end
