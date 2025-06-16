class UpdateSchemaForRoomsPuzzlesEndingsAndChoices < ActiveRecord::Migration[7.2]
  def change
    # Roomsテーブルの修正
    change_table :rooms do |t|
      t.remove :next_room_id, :back_room_id
      t.integer :room_type, default: 1, null: false
      t.boolean :is_dark, default: false
      t.boolean :requires_item, default: false
    end

    # NULL制約の追加
    change_column_null :rooms, :title, false
    change_column_null :rooms, :description, false

    # Puzzlesテーブルの修正
    change_table :puzzles do |t|
      t.string :title, null: false
      t.references :room, foreign_key: true
      t.remove :option_a, :option_b, :option_c
      t.json :choices, null: false, default: []
    end

    change_column_null :puzzles, :question, false
    change_column_null :puzzles, :correct_option, false

    # Endingsテーブルの修正
    change_table :endings do |t|
      t.string :theme_color
      t.text :condition
    end

    change_column_null :endings, :key, false
    change_column_null :endings, :title, false
    change_column_null :endings, :description, false
    add_index :endings, :key, unique: true

    # Choicesテーブルを作成
    create_table :choices do |t|
      t.references :room, null: false, foreign_key: true
      t.references :next_room, null: false, foreign_key: { to_table: :rooms }
      t.string :description, null: false
      t.text :condition
      t.boolean :is_backtrack, default: false

      t.timestamps
    end
  end
end
