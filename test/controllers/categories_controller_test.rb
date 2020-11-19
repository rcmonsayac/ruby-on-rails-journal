require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should get edit" do
    category = Category.new(name: "test name", description: "test description")
    category.save
    get edit_category_path(category.id)
    assert_response :success
  end

  test "should post update" do
    category = Category.new(name: "test name", description: "test description")
    category.save


    post update_category_path(category)
    assert_response :success
  end


end
