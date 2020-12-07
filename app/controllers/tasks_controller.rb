class TasksController < ApplicationController
    before_action :get_category


    def index
        @started_tasks = Task.where(completed: false, started: true, category_id: params[:category_id]).order(deadline: :asc)
        @completed_tasks = Task.where(completed: true, category_id: params[:category_id]).order(completed: :desc)
        @pending_tasks = Task.where(completed: false, started: false, category_id: params[:category_id]).order(deadline: :asc)
    end

    def show
        @task = Task.find(params[:id])  
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        @task.category_id = params[:category_id]
        if @task.save
            redirect_to category_tasks_path(params[:category_id])
        else
            render :new
        end
    end

    def edit
        @task = Task.find(params[:id])        
    end

    def update
        @task = Task.find(params[:id])  
        if @task.update(task_params)
            redirect_to category_tasks_path(params[:category_id])
        else
            render :edit
        end
    end

    def destroy
        @task = Task.find(params[:id])  
        if @task.destroy
            redirect_to category_tasks_path(params[:category_id])
        else
            render :edit
        end
    end

    private

    def get_category
        @category = Category.find_by(id: params[:category_id])
    end

    #strong parameter
    def task_params
        params.require(:task).permit(:title, :description, :deadline, :started, :started_at, :completed, :completed_at, :category_id)
    end
end

