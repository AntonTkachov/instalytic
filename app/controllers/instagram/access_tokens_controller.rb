class Instagram::AccessTokensController < ApplicationController
  def show
    @token = InstagramProxy.get_access_token(params[:code])
  end
end
