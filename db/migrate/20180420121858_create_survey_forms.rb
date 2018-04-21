class CreateSurveyForms < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_forms do |t|
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
