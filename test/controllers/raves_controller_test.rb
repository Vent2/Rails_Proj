require 'test_helper'

class RavesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rafe = raves(:one)
  end

  test "should get index" do
    get raves_url
    assert_response :success
  end

  test "should get new" do
    get new_rafe_url
    assert_response :success
  end

  test "should create rafe" do
    assert_difference('Rave.count') do
      post raves_url, params: { rafe: { date: @rafe.date, name: @rafe.name, price: @rafe.price } }
    end

    assert_redirected_to rafe_url(Rave.last)
  end

  test "should show rafe" do
    get rafe_url(@rafe)
    assert_response :success
  end

  test "should get edit" do
    get edit_rafe_url(@rafe)
    assert_response :success
  end

  test "should update rafe" do
    patch rafe_url(@rafe), params: { rafe: { date: @rafe.date, name: @rafe.name, price: @rafe.price } }
    assert_redirected_to rafe_url(@rafe)
  end

  test "should destroy rafe" do
    assert_difference('Rave.count', -1) do
      delete rafe_url(@rafe)
    end

    assert_redirected_to raves_url
  end
end
