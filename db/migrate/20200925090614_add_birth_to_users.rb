class AddBirthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birth, :date, null: false
  end
end
