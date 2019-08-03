class CreateSurveyResults < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_results do |t|
      t.integer :survey_form_id
      t.json :result
      t.integer :student_id
      t.string :class

      t.timestamps
    end
  end
end
