class CreatePostSubs < ActiveRecord::Migration[5.2]
  create_join_table :posts, :subs do |t|
    t.index :post_id
    t.index :sub_id
  end

end

