require 'rails_helper'

RSpec.describe "bill_lists/show", type: :view do
  before(:each) do
    @bill_list = assign(:bill_list, BillList.create!(
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
