class CreateSnkrs < ActiveRecord::Migration[6.1]
  def change
    create_table :snkrs do |t|
      t.string :name
      t.integer :score
      t.string :retailer
      t.integer :usage
      t.float :size

      t.timestamps
    end
  end
end
