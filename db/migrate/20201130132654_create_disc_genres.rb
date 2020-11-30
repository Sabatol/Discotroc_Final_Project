class CreateDiscGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :disc_genres do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :disc, null: false, foreign_key: true
      t.timestamps
    end
  end
end
