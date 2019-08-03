json.extract! survey_result, :id, :survey_form_id, :result, :student_id, :class, :created_at, :updated_at
json.url survey_result_url(survey_result, format: :json)
