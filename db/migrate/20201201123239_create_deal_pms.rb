class CreateDealPms < ActiveRecord::Migration[6.0]
  def change
    create_table :deal_pms do |t|
      t.references :deal, index: true 
      t.references :pm_author, index: true
      t.text :content 
      t.timestamps
    end
  end
end
