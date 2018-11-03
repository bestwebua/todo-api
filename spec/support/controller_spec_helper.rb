module ControllerSpecHelper
  def token_generator(user_id)
    Auth::JsonWebTokenService.encode(user_id: user_id)
  end

  def expired_token_generator(user_id)
    Auth::JsonWebTokenService.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  def valid_headers(version = 'v1')
    {
      'Authorization' => token_generator(user.id),
      'Content-Type' => 'application/json'
    }.merge('Accept' => "application/#{version}")
  end

  def invalid_headers(version = 'v1')
    {
      'Authorization' => nil,
      'Content-Type' => 'application/json'
    }.merge('Accept' => "application/#{version}")
  end
end
