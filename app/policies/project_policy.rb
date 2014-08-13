class ProjectPolicy < ApplicationPolicy

	# def index?
	# 	@user.admin? || @user.po?
	# end

	class Scope
		attr_reader :user, :scope

		def initialize(user, scope)
	    @user = user
	    @scope = scope
	  end

	  def resolve
	    if @user.admin? || @user.po?
	      scope
	    else
	      @user.projects
	    end
	  end
	end

	def create?
		user.admin? || user.po?
	end

# the pundit way of scoping - can be called like this:
# Pundit.policy_scope(user, Project.scope) - from everywhere, or
# policy_scope(Project.scope)  - from the controller

end

