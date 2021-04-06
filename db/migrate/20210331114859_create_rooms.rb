class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :snkr_id
      t.integer :offer_id

      t.timestamps
    end
  end
end
