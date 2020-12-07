class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :deal, index: true
      t.references :sender, index: true 
      t.references :receiver, index: true
      t.timestamps
    end
  end
end
