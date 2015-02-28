class UserMailer < ApplicationMailer
  default from: "no-reply@depot.com"

  def send_welcome_email(user, password)
    @user = user
    @password = password
    mail(to: user.email, subject: "Welcome to Depot!")
  end

end
