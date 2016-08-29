class AddUserIdToBacklogs < ActiveRecord::Migration[5.0]
  def change
    add_column :backlogs, :user_id, :integer, null: false
    add_index  :backlogs, :user_id
  end
end
