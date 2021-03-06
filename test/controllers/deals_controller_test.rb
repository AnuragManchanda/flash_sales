require 'test_helper'

class DealsControllerTest < ActionController::TestCase
  setup do
    @deal = deals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal" do
    assert_difference('Deal.count') do
      post :create, deal: { attachment: @deal.attachment, discounted_price: @deal.discounted_price, discription: @deal.discription, is_live: @deal.is_live, price: @deal.price, publish_date: @deal.publish_date, quantity: @deal.quantity, title: @deal.title }
    end

    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should show deal" do
    get :show, id: @deal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deal
    assert_response :success
  end

  test "should update deal" do
    patch :update, id: @deal, deal: { attachment: @deal.attachment, discounted_price: @deal.discounted_price, discription: @deal.discription, is_live: @deal.is_live, price: @deal.price, publish_date: @deal.publish_date, quantity: @deal.quantity, title: @deal.title }
    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should destroy deal" do
    assert_difference('Deal.count', -1) do
      delete :destroy, id: @deal
    end

    assert_redirected_to deals_path
  end
end
