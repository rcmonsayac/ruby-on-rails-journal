class TasksController < ApplicationController

    def index
        @started_tasks = Task.where(completed: false, started: true).order(deadline: :asc)
        @completed_tasks = Task.where(completed: true).order(completed: :desc)
        @pending_tasks = Task.where(completed: false, started: false).order(deadline: :asc)
    end

    def today
        @started_tasks = Task.where(completed: false, started: true, deadline: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(deadline: :asc)
        @completed_tasks = Task.where(completed: true, deadline: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(deadline: :desc)
        @pending_tasks = Task.where(completed: false, started: false, deadline: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(deadline: :asc)
    end

    def show
        @task = Task.find(params[:id])  
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to tasks_path
        else
            render :new
        end
    end

    def edit
        @task = Task.find(params[:id])        
    end

    def update
        @task = Task.find(params[:task][:id])  
        if @task.update(task_params)
            redirect_to tasks_path
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

