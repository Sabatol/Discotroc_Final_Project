class CreateDiscStates < ActiveRecord::Migration[6.0]
  def change
    create_table :disc_states do |t|
      t.string :name
      t.float :coefficient
      
      t.timestamps
    end
  end
end
