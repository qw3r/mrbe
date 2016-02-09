class ApplicationController < ActionController::API

  attr_reader :current_user

  before_action :authenticate, except: :health_check

  rescue_from(ActiveRecord::RecordNotFound) { head :not_found }
  rescue_from(ActionController::RoutingError) { head :not_found }



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
