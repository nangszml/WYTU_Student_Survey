class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	belongs_to :department, dependent: :destroy
	has_many :survey_results
end
