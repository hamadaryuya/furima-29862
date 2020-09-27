class AddFamilyNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_name, :string, null: false
  end
end
