class SurveyResult < ApplicationRecord
	belongs_to :survey_form
	belongs_to :student
end
