module Helpers
  module AuthHelper
    def basic_auth_header_for(username, password)
      {'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(username, password)}
    end



    def set_authenticated_user(user)
      allow_any_instance_of(AuthService).to receive(:authenticate).and_return(user)
    end
  end
end