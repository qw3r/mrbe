module Helpers
  module AuthHelper
    def basic_auth_header_for(username, password)
      {'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(username, password)}
    end
  end
end