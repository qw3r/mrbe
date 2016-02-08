require 'rails_helper'

RSpec.describe 'Application', type: :request do
  describe 'GET /unknown/route' do
    before { get '/unknown/route' }

    include_examples 'http_status', 404
  end

  describe 'GET /health-check' do
    before { get '/health-check' }

    include_examples 'http_status', 200

    it 'returns with status ok' do
      expect(json_response).to eq('status' => 'OK')
    end
  end
end