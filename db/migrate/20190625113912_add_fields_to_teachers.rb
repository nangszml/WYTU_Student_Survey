class AddFieldsToTeachers < ActiveRecord::Migration[5.2]
  def change
  	add_column :teachers, :name, :string
  	add_column :teachers, :department_id, :integer
  end
end
