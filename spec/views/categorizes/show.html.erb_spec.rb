require 'rails_helper'

RSpec.describe "categorizes/show", type: :view do
  before(:each) do
    @categorize = assign(:categorize, Categorize.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
