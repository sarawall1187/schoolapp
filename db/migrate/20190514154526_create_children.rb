class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :name
      t.integer :age
      t.integer :parent_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
