# frozen_string_literal: true

require_relative 'api/version'
require_relative 'api/offer'

module Hf
  module Api
    class OfferError < StandardError; end

    def self.new
      Offer.new
    end
  end
end
