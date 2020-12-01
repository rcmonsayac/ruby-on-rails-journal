class TasksController < ApplicationController
    class tasksController < ApplicationController

        def index
            @tasks = Task.all
        end
    
        def show
            @task = Task.find(params[:id])  
        end
    
        def new
            @task = task.new
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
    

    
end
