class CreateDiscTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :disc_tracks do |t|
      t.references :track, null: false, foreign_key: true
      t.references :disc, null: false, foreign_key: true
      t.timestamps
    end
  end
end
