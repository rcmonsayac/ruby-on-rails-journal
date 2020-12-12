class TasksController < ApplicationController
    before_action :authenticate_user!
    def index
        @started_tasks = Task.where(completed: false, started: true, user_id: current_user.id).order(deadline: :asc)
        @completed_tasks = Task.where(completed: true, user_id: current_user.id).order(completed: :desc)
        @pending_tasks = Task.where(completed: false, started: false, user_id: current_user.id).order(deadline: :asc)
    end

    def today
        @started_tasks = Task.where(user_id: current_user.id, completed: false, started: true, deadline: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(deadline: :asc)
        @completed_tasks = Task.where(user_id: current_user.id, completed: true, deadline: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(deadline: :desc)
        @pending_tasks = Task.where(user_id: current_user.id, completed: false, started: false, deadline: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(deadline: :asc)
    end

    def show
        @task = Task.find(params[:id])  
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        @task.user_id = current_user.id
        if @task.save
            redirect_to show_task_path(@task.id)
        else
            render :new
        end
    end

    def edit
        @task = Task.find_by(id: params[:id], user_id: current_user.id)        
    end

    def update
        @task = Task.find_by(id: params[:task][:id])  
        if @task.update(task_params)
          redirect_to show_task_path(@task.id)
        else
          render :edit
        end
    end

    def delete
        @task = Task.find(params[:id])  
        if @task.destroy
          redirect_to tasks_path
        else
          render :edit
        end
    end

    private
    #strong parameter
    def task_params
        params.require(:task).permit(:title, :description, :deadline, :started, :started_at, :completed, :completed_at, :category_id)
    end
end

