class SurveyAnswersController < ApplicationController

  def create
    # creating the answers for each question
    survey_answer_params.to_unsafe_h.map do |question_id, answer|
      if answer.present? # if answer present then entry will create
        survey_answer = current_user.survey_answers.create(survey_question_id: question_id)
        survey_answer.update(answer)
      end
    end
   # redirecting path for when answers is nil or present
   if SurveyForm.find(params[:survey_form_id]).survey_questions.first.survey_answers.where(user_id: current_user.id).first.answer.present?
    redirect_to survey_forms_path, flash: {message: "Thanks for submiting survery"}
   else
      redirect_to submit_survey_details_survey_form_path(params[:survey_form_id]), flash: {message: "Problem with submiting survery"}
   end
  end

  private
    def survey_answer_params
      params.require(:survey_answer).permit!
    end
end