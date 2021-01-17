require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest
  test "valid user should be able to make an account" do
    get '/signup'
    assert_response :success

    assert_difference 'User.count', 1 do
      post users_path, params: { user: { 
        username: "verdolaga", email: "verdolaga@localhost.com", password: "verdolaga1234" 
        } }
      assert_response :redirect
    end
  end

  test "invalid user should se errors & not be able to make an account " do
    get '/signup'
    assert_response :success

    assert_no_difference 'User.count' do
      post users_path, params: { user: { 
        username: "vd", email: "verdolagacom", password: "verdolaga1234" 
        } }
        
      assert_select "div.alert"
    end
  end
end
