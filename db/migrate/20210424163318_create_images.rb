class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :snkr_id
      t.integer :offer_id
      t.string :image

      t.timestamps
    end
  end
end
