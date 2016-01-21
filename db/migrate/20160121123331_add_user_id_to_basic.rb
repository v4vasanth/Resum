class AddUserIdToBasic < ActiveRecord::Migration
  def change
    add_column :basics, :user_id, :integer
  end
end
