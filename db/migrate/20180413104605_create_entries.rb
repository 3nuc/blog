class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :text
      t.string :password
      t.references :blogbase, foreign_key: true

      t.timestamps
    end
  end
end
