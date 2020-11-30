class CreateDiscArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :disc_artists do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :disc, null: false, foreign_key: true
      t.timestamps
    end
  end
end
