require 'rails_helper'

RSpec.describe "categorizes/edit", type: :view do
  before(:each) do
    @categorize = assign(:categorize, Categorize.create!())
  end

  it "renders the edit categorize form" do
    render

    assert_select "form[action=?][method=?]", categorize_path(@categorize), "post" do
    end
  end
end
