class SurveyQuestion < ApplicationRecord
  belongs_to :survey_form
  has_many :survey_answers
  has_many :survey_options, dependent: :destroy
  accepts_nested_attributes_for :survey_options, :allow_destroy => true

  FIELDS_TYPE = ["text_area","text_field","radio_button"]
end