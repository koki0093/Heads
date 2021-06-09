class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :snkr_id
<<<<<<< HEAD
      t.integer :offer_id
      t.integer :room_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false
=======
      t.integer :message_id
      t.integer :offer_id
      t.string :offer_consent
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false



>>>>>>> origin/master
      t.timestamps
    end
    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :snkr_id
<<<<<<< HEAD
=======
    add_index :notifications, :massage_id
>>>>>>> origin/master
  end
end
