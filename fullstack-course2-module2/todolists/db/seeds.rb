
#The commend delete all the data since I delete in the model orphaned records with dependent
User.destroy_all

#it create a user table amd assign it a variable then it create the peofile by using create_profile
fiorina = User.create!(username: "Fiorina", password_digest: "Carly")
fiorina.create_profile!(first_name: "Carly", last_name: "Fiorina", birth_year: 1954, gender: "female")

trump = User.create!(username: "Trump", password_digest: "Donald")
trump.create_profile!(first_name: "Donald", last_name: "Trump", birth_year: 1946, gender: "male")

carson = User.create!(username: "Carson", password_digest: "Ben")
carson.create_profile!(first_name: "Ben", last_name: "Carson", birth_year: 1951, gender: "male")

clinton = User.create!(username: "Clinton", password_digest: "Hillary")
clinton.create_profile!(first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female")


User.all.each_with_index do |user,index|
  todo_list=user.todo_lists.create!(
      list_name: "list_name #{index}",
      list_due_date: Date.today+1.year)

  (1..5).each do |task_number|
    todo_list.todo_items.create!(
        due_date: Date.today + 1.year,
        title: "Title #{index}",
        description: "This is task #{task_number}")
  end
end
