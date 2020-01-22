class CreateCardRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :card_relationships do |t|
      t.references :parent_card, index: true
      t.references :child_card, index: true

      t.timestamps
    end

    add_foreign_key :card_relationships, :cards, column: "parent_card_id", primary_key: "id"
    add_index :card_relationships, [:child_card_id, :parent_card_id]

    add_foreign_key :card_relationships, :cards, column: "child_card_id", primary_key: "id"
    add_index :card_relationships, [:parent_card_id,:child_card_id]
  end
end
