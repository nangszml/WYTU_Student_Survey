class AddFieldsToStudents < ActiveRecord::Migration[5.2]
  def change
  	add_column :students, :name, :string
  	add_column :students, :rollno, :string
  	add_column :students, :department_id, :integer
  end
end
