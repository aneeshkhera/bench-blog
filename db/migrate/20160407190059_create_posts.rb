class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :user
      t.string :sport
      t.string :text

      t.timestamps null: false
    end
  end
end
