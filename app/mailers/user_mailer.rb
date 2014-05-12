class UserMailer < ActionMailer::Base

  def welcome_email(user,password)
    @user = user
    @password = password
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: 'aura.planning@gmail.com', subject: 'Account Registered on Aura Scheduler')
  end
end
