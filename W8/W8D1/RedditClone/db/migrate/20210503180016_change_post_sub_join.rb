class ChangePostSubJoin < ActiveRecord::Migration[5.2]
  def change
    add_index :posts_subs, [:post_id, :sub_id], name: 'post_sub_un', unique: true
  end
end
