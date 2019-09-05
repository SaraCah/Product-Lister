require 'test/unit'
require_relative 'rating_number'

class RatingNumberTest < Test::Unit::TestCase
    #Create a new product and check if it has label name, type name and company name
    def test_label_name
        product = RatingNumber.new("kind")
        assert_equal(to_s)
    end
end


