# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def new_order(user)
    @user = user
    mail(to: @user.email, subject: 'Your order in Dionysus Store')
  end
end
