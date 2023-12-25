class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :room_image
      t.string :room_name
      t.string :introduction
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
