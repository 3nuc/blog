class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :poster_name
      t.text :content
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
