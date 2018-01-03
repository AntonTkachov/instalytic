# frozen_string_literal: true

# app/controllers/application_controller.rb
class FollowersController < ApplicationController
  def index
    @followers = [1,2,3,4,5]
  end
end
