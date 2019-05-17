class AddColumnToParents < ActiveRecord::Migration[5.2]
  def change
    add_column :parents, :uid, :integer, limit: 8
  end
end
