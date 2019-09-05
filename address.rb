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

    def to_s(format = 'short') #format of how it's inputed
        address = '' 
        case format
        when 'long' #input for  lonf address with 2 streets because i dont want empty space
            address += street_1 + "\n" #puts space so formatted nicely
            address += street_2 + "\n" unless street_2.nil? || street_2.empty? 
            address += "#{city}, #{state}, #{postal_code}" # put
        when 'short' #input for address with only 1 street because dont want empty space again
            address += "#{kind}: "
            address += street_1
            unless street_2.nil? || street_2.empty?
                address += " " + street_2
            end
            address += ", #{city}, #{state}, #{postal_code}" 
        end
        address # prints the address as formatted above
    end
end
