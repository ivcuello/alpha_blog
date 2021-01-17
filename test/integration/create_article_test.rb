require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  def setup
    @admin_user = User.create(
      username: "verdolaga", email: "verdolaga@local.com", 
      password:"verdolaga1234", admin: true
    )
    
    sign_in_as(@admin_user)
  end
  
  test "Article should be created successfuly" do
    get "/articles/new"
    assert_response :success

    assert_difference "Article.count", 1 do
        post articles_path, params: { article: { 
          title: "A valid title", 
          description: "A valid description" * 3,
          user_id: @admin_user.id
        }}

        assert_response :redirect
    end
  end

  test "Invalid article should show error" do
    get "/articles/new"
    assert_response :success

    assert_no_difference "Article.count" do
        post articles_path, params: { article: { 
          title: "Invalid title", 
          description: "Invalid",
          user_id: @admin_user.id
        }}
    end
  end
end
