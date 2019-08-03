class ChangeCoulmnNameInSurveyResults < ActiveRecord::Migration[5.2]
  def change
  	rename_column :survey_results, :survey_form_id, :department_id
  end
end
