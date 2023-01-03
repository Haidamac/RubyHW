class UserMailer < ApplicationMailer

  def welcome
    mail to: @user_email, subject: 'Your order in Dionysus Store'
  end
end
