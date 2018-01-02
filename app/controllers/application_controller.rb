# frozen_string_literal: true

# ActionController::Base is a basic controller class from rails
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
