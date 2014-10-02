class UserMailer < ActionMailer::Base

  default from: "saghir.alam.khatri@outlook.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

  def request_sent(user)
    @user=User.find(user)
    mail :to => @user.email, :subject => "New connection request"
  end

  def welcome_message(user)
    @user=user
    mail :to => user.email, :subject => "Welcome to Mentor Mentored"
  end

  def invite_message(email,user)
    @user=user
    mail :to => email, :subject => "Mentor Mentored joining invitation"
  end
end
