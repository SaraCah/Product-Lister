class RatingNumber

    attr_accessor :kind, :number #kind is just the comment, should change it but will get it, number is out of 10

    def to_s #to_s to add this homies together
        "#{kind}: #{number}"
    end
end
