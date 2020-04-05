require 'test_helper'

class EndBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get end_books_create_url
    assert_response :success
  end

  test "should get destroy" do
    get end_books_destroy_url
    assert_response :success
  end

end
