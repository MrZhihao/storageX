require 'SecureRandom'

module ApplicationHelper
  def generate_listing_id
    SecureRandom.hex
  end
end
