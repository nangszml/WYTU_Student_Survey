class SurveyForm < ApplicationRecord
	belongs_to :department
	has_many :survey_results

	serialize :question
end
