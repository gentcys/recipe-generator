class CreateSearchHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :search_histories do |t|
      t.string :keyword
      t.references :user

      t.timestamps
    end
  end
end
