require 'test_helper'

class ContragentsControllerTest < ActionController::TestCase
  setup do
    @contragent = contragents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contragents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contragent" do
    assert_difference('Contragent.count') do
      post :create, contragent: { comment: @contragent.comment, contact: @contragent.contact, name: @contragent.name, phone: @contragent.phone, rating: @contragent.rating, service: @contragent.service }
    end

    assert_redirected_to contragent_path(assigns(:contragent))
  end

  test "should show contragent" do
    get :show, id: @contragent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contragent
    assert_response :success
  end

  test "should update contragent" do
    patch :update, id: @contragent, contragent: { comment: @contragent.comment, contact: @contragent.contact, name: @contragent.name, phone: @contragent.phone, rating: @contragent.rating, service: @contragent.service }
    assert_redirected_to contragent_path(assigns(:contragent))
  end

  test "should destroy contragent" do
    assert_difference('Contragent.count', -1) do
      delete :destroy, id: @contragent
    end

    assert_redirected_to contragents_path
  end
end
