class CreateDiscStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :disc_styles do |t|
      t.references :style, null: false, foreign_key: true
      t.references :disc, null: false, foreign_key: true
      t.timestamps
    end
  end
end
