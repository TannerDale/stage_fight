class AddNilDefaultToCastUserId < ActiveRecord::Migration[7.0]
  def change
    change_column_default :casts, :user_id, nil
  end
end
