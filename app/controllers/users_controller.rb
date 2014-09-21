class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		if params['user']['password'] == params['user']['password_confirmation']
			token = SecureRandom.urlsafe_base64(24)
			@user = User.create	user_params.merge(confirmation_token: token)
			# UserMailer.signup_confirmation(@user).deliver
			redirect_to action: 'index', controller: 'projects'
		else
			render 'new'
		end
	end

	def confirmation
		user = User.find_by_confirmation_token(params[:confirmation_token])
		if user
			user.update_attributes!(confirmation_token: nil, confirmed: true)
			session[:user_id] = user.id
			redirect_to action: 'index', controller: 'projects'
		else
			redirect_to action: 'new', controller: 'sessions'
		end

	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :email)
	end
end
