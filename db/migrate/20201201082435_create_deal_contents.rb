class CreateDealContents < ActiveRecord::Migration[6.0]
  def change
    create_table :deal_contents do |t|
      
      t.references :deal, index: true 
      t.references :sender_library, index: true 
      t.references :receiver_library, index: true
      t.timestamps
    end
  end
end
