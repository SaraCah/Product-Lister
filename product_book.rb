require './product'
require 'yaml' #this is so i can write my data to yaml file

class ProductBook

    attr_reader :products

    def initialize
        @products = []  #want an empty array so user can put multiple products
        open
    end

    # Clears the content on the screen.
    def clear_screen!
        print "\e[2J" 
    end

    # Moves the "cursor" back to the upper left.
    def move_to_home!
        print "\e[H"  # puts cursor on first line
    end

    def reset_screen! #method to rest screen
        clear_screen!
        move_to_home!
    end
