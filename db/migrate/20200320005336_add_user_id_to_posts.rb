class AddUserIdToPosts < ActiveRecord::Migration[5.2]
    def up
      add_column :posts, :user_id, :integer
    end
end
  