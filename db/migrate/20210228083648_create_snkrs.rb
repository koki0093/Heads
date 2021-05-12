class CreateSnkrs < ActiveRecord::Migration[6.1]
  def change
    create_table :snkrs do |t|
      t.string :name
      t.integer :score
      t.string :retailer
      t.integer :usage
      t.float :size
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :image5

      t.timestamps
    end
  end
end
