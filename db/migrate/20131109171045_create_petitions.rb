class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end

    add_index :petitions, [:event_id, :user_id], unique: true
  end
end
