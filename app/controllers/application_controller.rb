class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'petyr-plet-plete-prez-tri-pryta-preplita')
  end
end
