require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
    test "should go to new category form and create" do

        get categories_path
        assert_response :success

        get new_category_path
        assert_response :success

        post create_category_path, params: { category: { name: "create integ name test", description: "create integ description test" } }
        assert_redirected_to categories_path

        follow_redirect!
        assert_response :success

        assert Category.find_by(name: "create integ name test")

    end
end
  