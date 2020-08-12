class RemoveUpdatedAtFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :updated_at, :datetime
  end
end
