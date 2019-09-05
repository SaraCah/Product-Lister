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

    def open(file_name = 'products.yml') #method to get my products input to write to yaml file
        @products = YAML.load_file(file_name) if File.exist?('products.yml')
    end

    def save(file_name = 'products.yml') #method to save the products to yaml file
        File.open(file_name, 'w') { |file| file.write(products.to_yaml) }
    end
