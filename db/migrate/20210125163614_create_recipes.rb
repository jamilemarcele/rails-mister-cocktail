class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.text :instruction
      t.references :cocktail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
