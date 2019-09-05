require './rating_number'
require './address'

class Product

    attr_writer :label_name, :type_name, :company_name
    attr_reader :rating_numbers, :addresses
   
    def initialize
        @rating_numbers = [] #want and empty array to add for above and below
        @addresses = []
    end

    def add_rating_number(kind, number) #method for adding the comment and number out of 10
        rating_number = RatingNumber.new #calls upon rating class
        rating_number.kind = kind #gets the kind which is yet again meant to be comment, just havent changed it
        rating_number.number = number #number for rating out for the 1-
        rating_numbers << rating_number #than chucks it into the empty array
    end


