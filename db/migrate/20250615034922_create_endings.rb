class CreateEndings < ActiveRecord::Migration[7.2]
  def change
    create_table :endings do |t|
      t.string :key
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
