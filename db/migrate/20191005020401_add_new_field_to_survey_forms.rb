class AddNewFieldToSurveyForms < ActiveRecord::Migration[5.2]
  def change
    add_column :survey_forms, :class_name, :string
  end
end
