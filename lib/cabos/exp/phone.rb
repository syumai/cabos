module Cabos::Exp
  class Phone < ::Cabos::Base
    config.phone.country = 'US'
    label :phone
    test do |country|
      country ||= config.phone.country
      # TODO: validate phone number
    end
  end
end
