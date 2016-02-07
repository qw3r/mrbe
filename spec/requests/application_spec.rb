require 'rails_helper'

RSpec.describe "Application", type: :request do
  describe "GET /unknown/route" do
    before { get "/unknown/route" }

    include_examples "http_status", 404
  end
end