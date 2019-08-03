class RemoveClassFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :class, :string
  end
end
