module BasicAuth
  def http_login
    user = Account.default_username
    pw = 'secret'

    request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::Basic.encode_credentials(
        user, pw
      )
  end
end
