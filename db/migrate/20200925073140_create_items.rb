class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer       :category_id       , null: false
      t.integer       :condition_id      , null: false
      t.integer       :delivery_fee_id   , null: false
      t.integer       :area_id           , null: false
      t.integer       :ship_days_id      , null: false
      t.timestamps
    end
  end
end
