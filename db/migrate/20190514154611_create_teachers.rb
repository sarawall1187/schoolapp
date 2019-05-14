class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :grade_taught
      t.integer :school_id

      t.timestamps
    end
  end
end
