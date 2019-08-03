class StudentsController < ApplicationController
	def index
		# params[:year]
		# (department_id: current_teacher.department_id, class_name: params[:year])
		@students = Student.where(department_id: current_teacher.department_id)
	end

	def show
		
	end

end
