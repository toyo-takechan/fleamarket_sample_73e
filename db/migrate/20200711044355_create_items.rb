class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,              null: false
      t.text :content,             null:false
      t.integer :category_id,      null: false, foreign_key: true
      t.string :size
      t.string :brand
      t.integer :condition,        null: false
      t.integer :postage_payer,    null: false
      t.integer :postage_type,     null: false
      t.integer :prefecture_id,    null:false,  foreign_key: true
      t.integer :preparation_day,  null: false
      t.integer :price,            null: false
      t.integer :seller_id,        null: false, foreign_key: true
      t.integer :buyer_id,                      foreign_key: true
      t.timestamps
    end
  end
end
