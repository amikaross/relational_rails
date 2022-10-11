class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :author, foreign_key: true
      t.boolean :part_of_series
      t.integer :word_count
      t.string :title
      t.string :genre

      t.timestamps
      
    end
  end
end
