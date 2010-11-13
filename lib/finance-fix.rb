module Finance # :nodoc
  # Finance::FIX - Parse FIX protocol messages
  class FIX
    VERSION = '0.0.1'

    def new
      yield self if block_given?
    end

    # Parse "message", returning array of FIX message nodes, broken down in arrays of keys and
    # values.
    def parse(msg)
      msg.split(/\x01/).collect { |pair| pair.split(/=/) }  # Split on "SOH then "="
    end

  end # class FIX
end # module Finance
