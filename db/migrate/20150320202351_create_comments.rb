class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :title, :string
      t.column :entry, :varchar
      t.column :date, :timestamp
      t.column :post_id, :integer
      t.integer :user_id


      t.timestamps
    end
  end
end
