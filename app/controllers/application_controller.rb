class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: Account.default_username, password: 'secret'

  before_action :prepare_account

  private

  def prepare_account
    @account ||= begin
      account = Account.find_by(username: Account.default_username)
      raise RecordNotFound, 'Account Not Found' unless account

      account
    end
  end
end
