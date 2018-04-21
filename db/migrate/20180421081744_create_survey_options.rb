class CreateSurveyOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_options do |t|
      t.string :option
      t.integer :survey_question_id
      t.timestamps
    end
  end
end
