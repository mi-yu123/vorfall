class CreateGameStates < ActiveRecord::Migration[7.2]
  def change
    create_table :game_states do |t|
      t.references :current_room, null: false, foreign_key: { to_table: :rooms }
      t.json :flags, null: false, default: {}

      t.timestamps
    end
  end
end
