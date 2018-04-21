class SurveyForm < ApplicationRecord
  belongs_to :user
  has_many :survey_questions
  accepts_nested_attributes_for :survey_questions
end
