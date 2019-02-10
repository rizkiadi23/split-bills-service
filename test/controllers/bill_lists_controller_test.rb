require 'test_helper'

class BillListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill_list = bill_lists(:one)
  end

  test "should get index" do
    get bill_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_bill_list_url
    assert_response :success
  end

  test "should create bill_list" do
    assert_difference('BillList.count') do
      post bill_lists_url, params: { bill_list: {  } }
    end

    assert_redirected_to bill_list_url(BillList.last)
  end

  test "should show bill_list" do
    get bill_list_url(@bill_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_bill_list_url(@bill_list)
    assert_response :success
  end

  test "should update bill_list" do
    patch bill_list_url(@bill_list), params: { bill_list: {  } }
    assert_redirected_to bill_list_url(@bill_list)
  end

  test "should destroy bill_list" do
    assert_difference('BillList.count', -1) do
      delete bill_list_url(@bill_list)
    end

    assert_redirected_to bill_lists_url
  end
end
