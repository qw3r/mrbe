class ApplicationController < ActionController::API
  include Pundit

  attr_reader :current_user

  before_action :authenticate, except: :health_check
  after_action :verify_authorized, except: [:index, :health_check]

  rescue_from(Pundit::NotAuthorizedError) { head :forbidden }
  rescue_from(ActiveRecord::RecordNotFound, ActionController::RoutingError) { head :not_found }
  rescue_from(ActionController::ParameterMissing) { head :bad_request }



  def authenticate
    @current_user = AuthService.new(request).authenticate
  end



  def unknown_route
    raise ActionController::RoutingError, "No route matches #{params[:unknown_route]}"
  end



  def health_check
    render json: {status: 'OK'}
  end
end
