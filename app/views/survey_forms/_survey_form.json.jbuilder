json.extract! survey_form, :id, :user_id, :title, :description, :created_at, :updated_at
json.url survey_form_url(survey_form, format: :json)
