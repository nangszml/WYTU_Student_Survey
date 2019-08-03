class Department < ApplicationRecord
	has_one :department
	has_many :students
	has_one :survey_form
end
