class RemoveUpdatedAtFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :updated_at, :datetime
  end
end
