require 'rails_helper'

RSpec.describe "categorizes/index", type: :view do
  before(:each) do
    assign(:categorizes, [
      Categorize.create!(),
      Categorize.create!()
    ])
  end

  it "renders a list of categorizes" do
    render
  end
end
