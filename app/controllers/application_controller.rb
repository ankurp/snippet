class ApplicationController < ActionController::API
  def home
    render json: {name: "Snippet Service", version: 1}
  end
end
