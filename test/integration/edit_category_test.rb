require 'test_helper'

class EditCategoryTest < ActionDispatch::IntegrationTest
    test "should go to edit category form and update" do

        category = Category.new(name: "edit integ name", description: "edit integ description")
        category.save

        get categories_path
        assert_response :success

        get edit_category_path(category.id)
        assert_response :success

        put update_category_path, params: { category: { id: category.id, name: "update integ name test", description: "update integ description test" } }
        assert_redirected_to categories_path

        follow_redirect!
        assert_response :success

        updated_category = Category.find(category.id)
        assert_equal(updated_category.name, "update integ name test")
        assert_equal(updated_category.description, "update integ description test")

    end
end


  