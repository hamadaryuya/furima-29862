class AddFamilyNameKanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_name_kana, :string
  end
end
