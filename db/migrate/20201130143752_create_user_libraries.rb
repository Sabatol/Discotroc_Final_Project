class CreateUserLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :user_libraries do |t|
      t.references :user, index: true
      t.references :disc, index: true
      t.text :description
      t.references :disc_state, index: true
      t.timestamps
    end
  end
end
