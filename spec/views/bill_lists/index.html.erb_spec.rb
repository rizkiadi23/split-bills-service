require 'rails_helper'

RSpec.describe "bill_lists/index", type: :view do
  before(:each) do
    assign(:bill_lists, [
      BillList.create!(
        :title => "Title",
        :description => "MyText"
      ),
      BillList.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of bill_lists" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
