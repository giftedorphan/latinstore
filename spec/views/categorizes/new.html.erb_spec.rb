require 'rails_helper'

RSpec.describe "categorizes/new", type: :view do
  before(:each) do
    assign(:categorize, Categorize.new())
  end

  it "renders new categorize form" do
    render

    assert_select "form[action=?][method=?]", categorizes_path, "post" do
    end
  end
end
