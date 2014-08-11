class Project < ActiveRecord::Base
	has_many :tasks
	has_and_belongs_to_many :users


	validates :name, presence: true

	def status
		statuses = self.tasks.pluck(:status).uniq

		if statuses.include? "todo"
			"todo"
		elsif statuses.include? "doing"
			"doing"
		elsif statuses.include? "done"
			"done"
		end

	end

end
