module CartProviders
  class Base
    attr_reader :cart

    def initialize(cart)
      @cart = cart
    end

    def sync
      fail NotImplementedError
    end
  end
end
