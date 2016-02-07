RSpec.shared_examples 'http_status' do |code|
  it "returns with HTTP status code: #{code}" do
    expect(response).to have_http_status(code)
  end
end


