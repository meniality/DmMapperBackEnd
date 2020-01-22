class CardRelationship < ApplicationRecord
  belongs_to :parent_card, class_name: "Card"
  belongs_to :child_card, class_name: "Card"

  
end
