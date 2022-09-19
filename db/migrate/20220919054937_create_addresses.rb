class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase
      t.string :zipcode
      t.integer :prefecture_id
      t.string :city
      t.string :address_num
      t.string :name_building
      t.string :phone_number
      t.timestamps
    end
  end
end
