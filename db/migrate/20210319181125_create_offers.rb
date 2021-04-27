class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.integer :user_id
      t.string :name
      t.integer :score
      t.string :retailer
      t.integer :usage
      t.float :size
      t.integer :snkr_id
      t.string :consent


      t.timestamps
    end
  end
end
