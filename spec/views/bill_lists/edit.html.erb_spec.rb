require 'rails_helper'

RSpec.describe "bill_lists/edit", type: :view do
  before(:each) do
    @bill_list = assign(:bill_list, BillList.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit bill_list form" do
    render

    assert_select "form[action=?][method=?]", bill_list_path(@bill_list), "post" do

      assert_select "input[name=?]", "bill_list[title]"

      assert_select "textarea[name=?]", "bill_list[description]"
    end
  end
end
