class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.boolean :sender_ok?, default: false
      t.boolean :receiver_ok?, default: false 

      t.references :sender, index: true 
      t.references :receiver, index: true
      
      t.timestamps
    end
  end
end
