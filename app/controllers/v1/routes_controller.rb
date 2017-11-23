class V1::RoutesController < ApplicationController
  def index
    @routes = Rails.application.routes.routes.map do |route|
      next if route.defaults.empty? || route.defaults[:controller]&.match(%r(^rails|^application$))

      {
        verb: route.verb.present? ? route.verb.downcase.to_sym : :all,
        path: route.path.spec.to_s,
        action: route.defaults[:action],
        controller: route.defaults[:controller]
      }
    end.compact

    render json: @routes
  end
end
