class CreateDiscs < ActiveRecord::Migration[6.0]
  def change
    create_table :discs do |t|
      t.string :title
      t.integer :release
      t.string :label
      t.string :country
      t.string :cover_picture   
      t.string :artist
      t.references :genre, index: true
      t.references :format, index: true
      t.timestamps
    end
  end
end
