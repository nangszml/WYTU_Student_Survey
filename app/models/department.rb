class Department < ApplicationRecord
	has_one :department
	has_many :students
	has_many :survey_forms
end
