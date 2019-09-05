class Address

    attr_accessor :kind, :street_1, :street_2, :city, :state, :postal_code #making this readable and writable

    def initialize(kind = nil, street_1 = nil, street_2 = nil, city = nil, state = nil, postal_code = nil) #made them all nil to begin with
        @kind = kind #yet again should use different name but felt it describet the best
        @street_1 = street_1
        @street_2 = street_2
        @city = city
        @state = state
        @postal_code = postal_code
    end
end