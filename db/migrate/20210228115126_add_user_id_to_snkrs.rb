class AddUserIdToSnkrs < ActiveRecord::Migration[6.1]
  def change
    add_column :snkrs, :user_id, :integer
  end
end
