# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'pry'

status = ["todo", "doing", "done"]

(1..5).each do |user_index|
	User.create email:"email-#{user_index}@gmail.com", username: "user0#{user_index}", password: "pwd00#{user_index}", confirmation_token: SecureRandom.urlsafe_base64(24)
end

(1..100).each do |proj_index|
	project = Project.create name: "Project #{proj_index}"

	(1..rand(1..3)).each do
		project.users << User.find(rand(1..5))
	end

	(1..rand(2..5)).each do |task_index|
		Task.create name: "Task #{task_index}", status: status[rand(0..2)], project_id: project.id, user_id: project.users[rand(0..project.users.length-1)].id
	end

end