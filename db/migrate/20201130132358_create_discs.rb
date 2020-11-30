class CreateDiscs < ActiveRecord::Migration[6.0]
  def change
    create_table :discs do |t|
      t.string :title
      t.integer :release
      t.string :code
      t.integer :value
      t.string :label
      t.string :format
      t.string :country
      t.string :cover_picture       
      t.timestamps
    end
  end
end
