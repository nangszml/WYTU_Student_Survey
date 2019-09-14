Rails.application.routes.draw do
  get 'dashboard/index'
	devise_for :students, controllers: { sessions: 'students/sessions' }
	devise_for :teachers, skip: :registrations, controllers: { sessions: 'teachers/sessions' }

	resources :departments
	resources :students
	resources :teachers

	get 'welcome/index'
	
	authenticated :student do
		root 'survey_results#new', as: :authenticated_student_dashboard
	end

	authenticated :teacher do
		root 'dashboard#index', as: :dashboard
		# root 'departments#index', as: :authenticated_teacher_dashboard
	end

	root 'welcome#index'

	resources :survey_forms
  	resources :survey_results
  	post 'create_survey_result' => 'survey_results#create_survey_result'
end
