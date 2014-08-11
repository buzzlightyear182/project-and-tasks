# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.create name: "Getting a sim card for Jane"
Project.create name: "Getting rid of a cold"

Task.create name: "Evaluate prices", project_id: 1, status: "doing"
Task.create name: "Go and buy it", project_id: 1, status: "todo"
Task.create name: "Get some legal meds", project_id: 2, status: "todo"
Task.create name: "Buy tissue", project_id: 2, status: "todo"
Task.create name: "Stop sneezing", project_id: 2, status: "done"
