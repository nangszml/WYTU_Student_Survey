class CreateSurveyForms < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_forms do |t|
      t.string :name
      t.text :description
      t.text :question
      t.integer :department_id

      t.timestamps
    end
  end
end
