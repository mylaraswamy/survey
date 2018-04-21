class SurveyFormsController < ApplicationController
  before_action :set_survey_form, only: %w(show edit update destroy submit_survey_details)
  before_action :check_admin_user, only: %(new)
  def index
    @survey_forms = SurveyForm.all
  end

  def show; end

  def new
    @survey_form = current_user.survey_forms.new
    @survey_questions = @survey_form.survey_questions.new
  end

  def edit; end

  def create
    @survey_form = current_user.survey_forms.new(survey_form_params)

    respond_to do |format|
      if @survey_form.save
        format.html { redirect_to @survey_form, notice: 'Survey form was successfully created.' }
        format.json { render :show, status: :created, location: @survey_form }
      else
        format.html { render :new }
        format.json { render json: @survey_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @survey_form.update(survey_form_params)
        format.html { redirect_to @survey_form, notice: 'Survey form was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_form }
      else
        format.html { render :edit }
        format.json { render json: @survey_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @survey_form.destroy
    respond_to do |format|
      format.html { redirect_to survey_forms_url, notice: 'Survey form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def submit_survey_details; end

  private

    def set_survey_form
      @survey_form = SurveyForm.find(params[:id])
    end

    def survey_form_params
      params.require(:survey_form).permit(:user_id, :name, :description, survey_questions_attributes:[:question,:question_type, :_destroy, :id,survey_options_attributes:[:option, :_destroy, :id]])
    end

    def check_admin_user
      redirect_to survey_forms_path, flash: {message: "Your not having access for this page"} if current_user.has_role? "user"
    end
end
