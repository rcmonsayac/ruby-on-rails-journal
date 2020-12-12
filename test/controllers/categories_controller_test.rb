require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @category = categories(:test_category)
    @user = users(:test_user)
    sign_in(@user)
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should create new category" do 
    post create_category_path, params: { category: { name: "create name", description: "create description" } }
    assert_redirected_to categories_path
    assert Category.find_by(name: "create name")
  end

  test "should get edit" do
    get edit_category_path(@category.id)
    assert_response :success
  end

  test "should update category" do

    put update_category_path, params: { category: { id: @category.id, name: "update name updated", description: "update description updated" } }
    assert_redirected_to categories_path

    updated_category = Category.find(@category.id)
    assert_equal(updated_category.name, "update name updated")
    assert_equal(updated_category.description, "update description updated")
  end

  test "should delete category" do
    delete delete_category_path(@category.id)
    assert_redirected_to categories_path

    assert_nil Category.find_by(id: @category.id)
  end
end
