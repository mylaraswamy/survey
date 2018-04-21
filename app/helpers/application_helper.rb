module ApplicationHelper
  def ensure_survey_form form_id
    SurveyForm.find(form_id).survey_questions.first.survey_answers.where(user_id: current_user.id).first.present?
  end
end
