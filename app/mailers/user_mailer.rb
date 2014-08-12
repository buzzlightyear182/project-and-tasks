class UserMailer < ActionMailer::Base
  default from: "jane.buzzlightyear@gmail.com"

  def signup_confirmation(user)
  	@user = user
  	@link = user_activation_link(user)

  	@greeting = "Thanks for signing up!"
  	@email = user.email

  	mail(to: @email, subject: @greeting)
  end

private
  def user_activation_link(user)
  	"http://localhost:3000/users/confirmation/#{user.confirmation_token}"
  end

end
