class RemoveTelephoneNumberFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_index :addresses, :telephone_number
    remove_column :addresses, :telephone_number, :string
  end
end
