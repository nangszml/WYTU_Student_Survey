class StudentsController < ApplicationController
	def index
		# params[:year]
		# (department_id: current_teacher.department_id, class_name: params[:year])
		if params[:year].present?
			@students = Student.where(class_name: params[:year])
		else  
			@students = Student.where(department_id: current_teacher.department_id)
		end
	end

	def show
		
	end

end
