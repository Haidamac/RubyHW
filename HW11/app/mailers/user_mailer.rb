class UserMailer < ApplicationMailer
  def new_order(user, order)
    mail(to: user.email, subject: 'Your order in Dionysus Store')
  end
end
