require "net/http"
require "uri"

class InstagramProxy
  OAUTH_URL = 'https://api.instagram.com/oauth/'
  API_URL = 'https://api.instagram.com/v1/'

  def self.code_url
    "#{OAUTH_URL}authorize?client_id=#{client_id}" \
                    "&redirect_uri=#{redirect_uri}" \
                    '&response_type=code&scope=follower_list'
  end

  def self.get_access_token(code)
    uri = URI.parse("#{OAUTH_URL}access_token")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data({
      client_id: client_id,
      client_secret: client_secret,
      grant_type: 'authorization_code',
      redirect_uri: redirect_uri,
      code: code
    })

    response = http.request(request)
    JSON.parse(response.body)['access_token']
  end

  def initialize
    @access_token = Rails.application.secrets.access_token
  end

  def follows
    uri = URI.parse("#{API_URL}/users/self/followed-by?" \
                    "access_token=#{@access_token}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    response
  end

  def followed_by
  end

  private
  def self.client_id
    Rails.application.secrets.instagram_client_id
  end

  def self.client_secret
    Rails.application.secrets.instagram_client_secret
  end

  def self.redirect_uri
    host + 'instagram/access_token'
  end

  def self.host
    ENV['HOST']
  end
end
