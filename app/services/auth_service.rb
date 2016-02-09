class AuthService

  def initialize(request)
    @request = request
  end



  def authenticate
    ActionController::HttpAuthentication::Basic.authenticate(@request) do |username, password|
      User.find_by(username: username).try(:authenticate, password)
    end || User.new
  end



  private

  attr_reader :request
end
