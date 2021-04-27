class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :snkr_id
      t.integer :message_id
      t.integer :offer_id
      t.string :offer_consent
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false



      t.timestamps
    end
    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :snkr_id
    add_index :notifications, :massage_id
  end
end
