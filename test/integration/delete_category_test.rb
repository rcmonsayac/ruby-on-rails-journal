class DeleteCategoryTest < ActionDispatch::IntegrationTest
    test "should go to edit category form and update" do

        category = Category.new(name: "delete integ name", description: "delete integ description")
        category.save

        get categories_path
        assert_response :success

        get edit_category_path(category.id)
        assert_response :success

        delete delete_category_path(category.id)
        assert_redirected_to categories_path

        follow_redirect!
        assert_response :success

        assert_nil Category.find_by(id: category.id)
    end
end