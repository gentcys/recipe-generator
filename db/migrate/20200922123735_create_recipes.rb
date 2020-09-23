class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name, limit: 16
      t.text :description
      t.integer :time
      t.integer :difficulty

      t.timestamps
    end
  end
end
