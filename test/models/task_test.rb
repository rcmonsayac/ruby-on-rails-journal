require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @category = categories(:test_category)
  end

  test "should create new Task" do
    task = Task.new(title: "test title", category_id: @category.id)
    assert task.save
  end

  test "should not create duplicate task title" do
    task = Task.new(title: "test title", category_id: @category.id)
    task.save

    duplicate_task = Task.new(title: "test title", category_id: @category.id)
    assert_not duplicate_task.save
  end

  test "should not save Task without title" do
    task = Task.new(category_id: @category.id)
    assert_not task.save
  end

  test "should not save Task without category" do
    task = Task.new(title: "test title")
    assert_not task.save
  end

end
