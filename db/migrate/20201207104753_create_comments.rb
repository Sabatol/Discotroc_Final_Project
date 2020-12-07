class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :comment_sender, index: true
      t.references :comment_receiver, index: true 
      t.references :deal
      t.timestamps
    end
  end
end
