class CreateSurveyAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_answers do |t|
      t.text :answer
      t.text :options, array: true, default: []
      t.integer :user_id
      t.integer :survey_question_id
      t.timestamps
    end
  end
end
