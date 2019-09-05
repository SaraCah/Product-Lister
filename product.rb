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

    def add_address(kind, street_1, street_2 = nil, city, state, postal_code) #method to add in address
        address = Address.new #calls upon address calss
        address.kind = kind #kind of address, could have used better word really but is to stand for department stores,
        address.street_1 = street_1 #next few lines just the postal code
        address.street_2 = street_2
        address.city = city
        address.state = state
        address.postal_code = postal_code
        addresses << address #chucks the address into the empty array
    end

    def label_name  #writer instance variable for label of product
        @label_name
    end

    def type_name  #writer instatnce variable for type of product
        @type_name
    end

    def company_name #writer instance variable for company name of product
        @company_name
    end

    def product_company  #method for for printing label name, this was in test and i forgot why did it but think again sara
        product_company = label_name
        product_company += " #{company_name}" unless @company_name.nil?

        product_company
    end
    
    def company_product #method for printing company_name, this was in test and i forgot why did it but think again sara
        company_product = company_name
        company_product += ", #{label_name}" unless @label_name.nil?
        company_product += " #{type_name.slice(0,1)}." unless @type_name.nil?

        company_product
    end
