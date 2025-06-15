class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :description
      t.integer :next_room_id
      t.integer :back_room_id
      t.integer :puzzle_id
      t.boolean :is_ending, default: false
      t.string :ending_key

      t.timestamps
    end
  end
end
