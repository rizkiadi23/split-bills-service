require 'rails_helper'

RSpec.describe "bill_lists/new", type: :view do
  before(:each) do
    assign(:bill_list, BillList.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new bill_list form" do
    render

    assert_select "form[action=?][method=?]", bill_lists_path, "post" do

      assert_select "input[name=?]", "bill_list[title]"

      assert_select "textarea[name=?]", "bill_list[description]"
    end
  end
end
