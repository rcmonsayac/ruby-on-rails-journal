require 'test_helper'

class CategoryFlowTest < ActionDispatch::IntegrationTest

    setup do
        @category = categories(:test_category)
    end

    test "should go to new category form and create" do
        get categories_path
        assert_response :success

        get new_category_path
        assert_response :success

        post categories_path, params: { category: { name: "create integ name test", description: "create integ description test" } }
        assert_redirected_to categories_path

        follow_redirect!
        assert_response :success

        assert Category.find_by(name: "create integ name test")
        assert_select "span", "create integ name test"
        assert_select "span", "create integ description test"

    end
    
    test "should go to edit category form and update" do
        get categories_path
        assert_response :success

        get edit_category_path(@category.id)
        assert_response :success

        assert_select "form input[type=text][value='#{@category.name}']"
        assert_select "form input[type=text][value='#{@category.description}']"

        put category_path(@category.id), params: { category: {name: "update integ name test", description: "update integ description test" } }
        assert_redirected_to categories_path

        follow_redirect!
        assert_response :success

        updated_category = Category.find(@category.id)
        assert_equal(updated_category.name, "update integ name test")
        assert_equal(updated_category.description, "update integ description test")

        assert_select "span", "update integ name test"

        assert_select "span", { count: 0, text: "Name Category Test" }

    end

    test "should go to edit category form and delete" do
        get categories_path
        assert_response :success

        get edit_category_path(@category.id)
        assert_response :success

        assert_select "form input[type=text][value='#{@category.name}']"
        assert_select "form input[type=text][value='#{@category.description}']"

        delete category_path(@category.id)
        assert_redirected_to categories_path

        follow_redirect!
        assert_response :success

        assert_select "span", { count: 0, text: @category.name }

        assert_nil Category.find_by(id: @category.id)
    end


end
  