class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		if params['user']['password'] == params['user']['password_confirmation']
			@user = User.create	user_params
			redirect_to action: 'index', controller: 'projects'
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :email)
	end
end