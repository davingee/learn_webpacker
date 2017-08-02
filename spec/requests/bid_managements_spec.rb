require 'rails_helper'

RSpec.describe "BidManagements", type: :request do
  describe "GET /bid_managements" do
    it "works! (now write some real specs)" do
      get bid_managements_path
      expect(response).to have_http_status(200)
    end
  end
end
