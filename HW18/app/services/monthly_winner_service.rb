# frozen_string_literal: true

class MonthlyWinnerService
  attr_reader :winners

  def initialize(winners)
    @winners = winners
  end

  def call
    users = lottery_orders.map(&:user).uniq.sample(2)

    users.each do |user|
      UserMailer.monthly_winner(user).deliver_later
    end
  end

  private

  def lottery_orders
    @finish_date = DateTime.now
    @start_date = @finish_date - 1.month
    Order.where(created_at: @start_date..@finish_date).paid
  end
end
