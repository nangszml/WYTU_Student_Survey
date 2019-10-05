class RemoveDescriptionFromSurveyForms < ActiveRecord::Migration[5.2]
  def change
    remove_column :survey_forms, :description, :text
  end
end
