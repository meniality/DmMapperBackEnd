class Card < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  
  has_many :child_relationships, foreign_key: :child_card_id, class_name: "CardRelationship"
  has_many :parentCards, through: :child_relationships, source: :parent_card, dependent: :destroy

  has_many :parent_relationships, foreign_key: :parent_card_id, class_name: "CardRelationship"
  has_many :childCards, through: :parent_relationships, source: :child_card, dependent: :destroy

  validates :name, presence: true
  validates :user_id, presence: true

  accepts_nested_attributes_for :parentCards
end
