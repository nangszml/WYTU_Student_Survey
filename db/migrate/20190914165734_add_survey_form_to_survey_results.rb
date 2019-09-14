class AddSurveyFormToSurveyResults < ActiveRecord::Migration[5.2]
  def change
    add_reference :survey_results, :survey_form, foreign_key: true
  end
end
