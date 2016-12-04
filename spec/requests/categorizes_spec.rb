require 'rails_helper'

RSpec.describe "Categorizes", type: :request do
  describe "GET /categorizes" do
    it "works! (now write some real specs)" do
      get categorizes_path
      expect(response).to have_http_status(200)
    end
  end
end
