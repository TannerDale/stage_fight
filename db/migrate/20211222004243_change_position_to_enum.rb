class ChangePositionToEnum < ActiveRecord::Migration[7.0]
  def change
    remove_column :casts, :position
    add_column :casts, :position, :integer
  end
end
