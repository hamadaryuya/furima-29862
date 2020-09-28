class AddGivenNameKanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :given_name_kana, :string, null: false
  end
end
