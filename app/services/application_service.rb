require 'dry/monads/result'

class ApplicationService
    extend Dry::Initializer
    include Dry::Monads[:result]

    # keeping it DRY for now, but eventually the monads may be nice here
    def self.call(**args)
        new(**args).call
    end

    def call
        raise 'Not Implemented'
    end
end
  