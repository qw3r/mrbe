class ApplicationController < ActionController::API

  rescue_from(ActiveRecord::RecordNotFound) { head :not_found }
  rescue_from(ActionController::RoutingError) { head :not_found }


  def unknown_route
    raise ActionController::RoutingError, "No route matches #{params[:unknown_route]}"

  end
end
