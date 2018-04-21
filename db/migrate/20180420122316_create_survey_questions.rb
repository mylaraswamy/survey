class CreateSurveyQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_questions do |t|
      t.integer :survey_form_id
      t.string :question
      t.string :question_type

      t.timestamps
    end
  end
end
