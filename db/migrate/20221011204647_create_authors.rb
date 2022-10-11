class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.boolean :active
      t.integer :dob_year
      t.string :name
      t.string :country

      t.timestamps
      
    end
  end
end
