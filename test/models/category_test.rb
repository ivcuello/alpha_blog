require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  self.use_transactional_tests = false

  def setup
    @category = Category.new(name: "Sports")
  end

  test "category should be valid" do 
    @category = Category.new(name: "News")
    assert @category.valid?
  end 

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    if !Category.where(name: @category.name)
      @category.save
    end

    @duplicate = Category.new(name: @category.name)
    assert_not @duplicate.valid?
  end

  test "uniqueness should not be case sensitive" do
    if !Category.where(name: @category.name)
      @category.save
    end
    
    @duplicate = Category.new(name: @category.name.downcase)
    assert_not @duplicate.valid?
  end

  test "name should not be too long" do
    @category.name = "n" * 26
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "n" * 2
    assert_not @category.valid?
  end
end