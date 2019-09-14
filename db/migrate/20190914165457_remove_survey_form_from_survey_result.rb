class RemoveSurveyFormFromSurveyResult < ActiveRecord::Migration[5.2]
  def change
    remove_column :survey_results, :survey_form_id
  end
end
