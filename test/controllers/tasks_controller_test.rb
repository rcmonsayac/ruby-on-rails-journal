require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:test_category)
    @task = tasks(:test_task)
    @started_task = tasks(:test_task_started)
  end

  test "should get task index view" do
    get category_tasks_path(@category.id)
    assert_response :success
  end

  test "should get new task view" do
    get new_category_task_path(@category.id)
    assert_response :success
  end

  test "should create new task" do 
    post category_tasks_path(@category.id), params: { task: { title: "create title", deadline: Time.new(2020, 12, 31) } }
    assert_redirected_to category_tasks_path
    assert Task.find_by(title: "create title")
  end

  test "should get edit task" do
    get edit_category_task_path(@category.id, @task.id)
    assert_response :success
  end

  test "should start task" do
    started_date = Time.now
    put category_task_path(@category.id, @task.id), params: { task: {started: true, started_at: started_date } }
    assert_redirected_to category_tasks_path

    started_task = Task.find(@task.id)
    # assert_equal(completed_date,  completed_task.completed_at)
    assert_equal(true, started_task.started)
  end
  
  test "should complete task" do
    completed_date = Time.now
    put category_task_path(@category.id, @started_task.id), params: { task: {completed: true, completed_at: completed_date } }
    assert_redirected_to category_tasks_path

    completed_task = Task.find(@started_task.id)
    # assert_equal(completed_date,  completed_task.completed_at)
    assert_equal(true, completed_task.completed)
  end

  test "should delete task" do
    delete category_task_path(@category.id, @task.id)
    assert_redirected_to category_tasks_path

    assert_nil Task.find_by(id: @task.id)
  end
  

end
