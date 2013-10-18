class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :when
      t.integer :duration
      t.string :address
      t.string :city
      t.string :country
      t.string :name
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
