require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Category should not save without name" do
    category  = Category.new
    assert_not category.save
  end

  test "Category name should be unique" do
    original  = Category.new(name: "original name")
    duplicate  = Category.new(name: "original name")

    original.save
    assert_not duplicate.save
  end
end

