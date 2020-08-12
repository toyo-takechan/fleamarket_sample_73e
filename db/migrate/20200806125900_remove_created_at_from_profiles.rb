class RemoveCreatedAtFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :created_at, :datetime
  end
end
