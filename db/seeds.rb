puts "###### Create Roles ####"

Role.create([{name: "admin"}, {name: "user"}])

puts "###### Create Admin ####"

user = User.create(email: "admin@admin.com", password: "password", password_confirmation: "password")

user.add_role("admin")

puts "###### Creating Survey Forms and Questions ########"

(1..10).each do
  # create survey_form
  survery_form = SurveyForm.create(name: Forgery('lorem_ipsum').title, description: Forgery('lorem_ipsum').text, user_id: user.id )
  # create survey questions
  ["text_area","text_field","radio_button"].each do |type|
    survery_form.survey_questions.create(question: Forgery('lorem_ipsum').title, question_type: type)
  end
  # assign options for radio_button type question
  (1..2).each do
    survery_form.survey_questions.last.survey_options.create(option: Forgery('lorem_ipsum').word)
  end
end

puts "####### Create Demo User ######"

user1 = User.create(email: "user@demo.com", password: "password", password_confirmation: "password")

user1.add_role("user")