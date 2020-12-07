class HomeController < ApplicationController
  def today
    @started_tasks = Task.where(completed: false, started: true, deadline: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(deadline: :asc)
    @completed_tasks = Task.where(completed: true, deadline: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(deadline: :desc)
    @pending_tasks = Task.where(completed: false, started: false, deadline: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(deadline: :asc)
  end
end
