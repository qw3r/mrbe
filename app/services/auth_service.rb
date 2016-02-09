class AuthService

  def initialize(request)
    @request = request
  end



  def authenticate
    User.new
  end



  private

  attr_reader :request
end
