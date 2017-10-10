require 'google/apis/people_v1'
require 'google/api_client/client_secrets'

class UserController < ApplicationController
  def create
    client_secrets = Google::APIClient::ClientSecrets.load
    auth_client = client_secrets.to_authorization
    auth_client.update!(
      scope: 'https://www.googleapis.com/auth/userinfo.email',
      redirect_uri: 'http://localhost:3000/oauth2callback',
      additional_parameters: {
        'access_type' => 'offline',         # offline access
        'include_granted_scopes' => 'true'  # incremental auth
      }
    )
    auth_uri = auth_client.authorization_uri.to_s
    redirect_to auth_uri
  end

  def add_or_update
    client_secrets = Google::APIClient::ClientSecrets.load
    auth_client = client_secrets.to_authorization
    auth_client.update!(
      scope: 'https://www.googleapis.com/auth/userinfo.email',
      redirect_uri: 'http://localhost:3000/oauth2callback'
    )
    if params[:error]
      redirect_to '/'
    else
      auth_client.code = params[:code]
      auth_client.fetch_access_token!
      people = Google::Apis::PlusV1::PlusService.new
      debugger
    end
  end
end
