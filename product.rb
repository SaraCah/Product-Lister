require './rating_number'
require './address'

class Product

    attr_writer :label_name, :type_name, :company_name
    attr_reader :rating_numbers, :addresses
   
    def initialize
        @rating_numbers = [] #want and empty array to add for above and below
        @addresses = []
    end

