# frozen_string_literal: true

# ApplicationRecord is a basic model class from rails
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
