class CreatePuzzles < ActiveRecord::Migration[7.2]
  def change
    create_table :puzzles do |t|
      t.string :question
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :correct_option
      t.text :explanation

      t.timestamps
    end
  end
end
