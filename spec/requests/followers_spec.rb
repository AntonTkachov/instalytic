# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Followers' do
  describe 'GET /followers' do
    it 'returns success status' do
      get followers_path
      expect(response).to have_http_status(200)
    end
  end
end
