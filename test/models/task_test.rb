require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @category = categories(:test_category)
    @user = users(:test_user)
    sign_in(@user)
  end

  test "should create new Task" do
    task = Task.new(title: "test title", category_id: @category.id, deadline: Time.new(2020, 12, 31), user_id: @user.id)
    assert task.save
  end

  test "should not create duplicate task title" do
    task = Task.new(title: "test title", category_id: @category.id, user_id: @user.id)
    task.save

    duplicate_task = Task.new(title: "test title", category_id: @category.id, user_id: @user.id)
    assert_not duplicate_task.save
  end

  test "should not save Task without title" do
    task = Task.new(category_id: @category.id, user_id: @user.id)
    assert_not task.save
  end

  test "should not save Task without category" do
    task = Task.new(title: "test title", user_id: @user.id)
    assert_not task.save
  end

end
