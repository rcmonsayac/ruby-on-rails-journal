require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:test_category)
    @task = tasks(:test_task)
  end

  test "should get task index view" do
    get tasks_path
    assert_response :success
  end

  test "should get new task view" do
    get new_task_path
    assert_response :success
  end

  test "should create new task" do 
    post create_task_path, params: { task: { title: "create title", category_id: @category.id, deadline: Time.new(2020, 12, 31) } }
    assert_redirected_to tasks_path
    assert Task.find_by(title: "create title")
  end

  test "should get edit task" do
    get edit_task_path(@task.id)
    assert_response :success
  end

  test "should start task" do
    started_date = Time.now
    put update_task_path, params: { task: { id: @task.id, started: true, started: started_date } }
    assert_redirected_to tasks_path

    started_task = Task.find(@task.id)
    # assert_equal(completed_date,  completed_task.completed_at)
    assert_equal(true, started_task.started)
  end
  
  test "should complete task" do
    started_task = tasks(:test_task_started)
    completed_date = Time.now
    put update_task_path, params: { task: { id: started_task.id, completed: true, completed_at: completed_date } }
    assert_redirected_to tasks_path

    completed_task = Task.find(started_task.id)
    # assert_equal(completed_date,  completed_task.completed_at)
    assert_equal(true, completed_task.completed)
  end

  test "should delete task" do
    delete delete_category_path(@task.id)
    assert_redirected_to tasks_path

    assert_nil Task.find_by(id: @task.id)
  end
  

end
