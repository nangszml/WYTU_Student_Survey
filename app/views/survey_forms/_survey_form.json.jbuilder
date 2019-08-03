json.extract! survey_form, :id, :name, :description, :question, :department_id, :created_at, :updated_at
json.url survey_form_url(survey_form, format: :json)
