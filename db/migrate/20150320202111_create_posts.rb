class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :entry, :varchar
      t.column :date, :timestamp


      t.timestamps
    end
  end
end
