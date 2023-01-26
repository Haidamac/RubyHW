# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def new_order(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Your order in Dionysus Store')
  end
end
