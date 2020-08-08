class RemoveCreatedAtFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :created_at, :datetime
  end
end
