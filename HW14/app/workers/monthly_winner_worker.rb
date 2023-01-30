# frozen_string_literal: true

require 'sidekiq-scheduler'

class MonthlyWinnerWorker
  # include Sidekiq::Worker
  include Sidekiq::Worker

  def perform
    MonthlyWinnerService.new(winners: 'MonthlyWinner').call
  end
end
