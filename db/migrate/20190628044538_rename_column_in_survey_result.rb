class RenameColumnInSurveyResult < ActiveRecord::Migration[5.2]
  def change
  	rename_column :survey_results, :class, :class_name
  end
end
