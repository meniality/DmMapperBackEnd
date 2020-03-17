class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :short_description
      t.string :text
      t.string :image
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
