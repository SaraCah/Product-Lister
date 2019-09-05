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

    def run
        loop do
            reset_screen! #first reset screen and displays my menu
            puts 'Products List Main Menu'.red
            puts 'a: Add A Product'
            puts 'p: Print Product List'
            puts 's: Search Product List'
            puts 'e: Save & Exit'
            print 'Enter your choice: '

            input = gets.chomp.downcase #prompts user to put in the option for above

            case input 
            when 'a'
                add_product #returns to add_product method which defined below
            when 'p'
                print_label_list #prints all product list which is defined below
            when 's'
                reset_screen!  #resets me screen
                print 'Search for: '
                search = gets.strip # user input
                find_by_name(search) # find by name method defined below
                find_by_address(search) #if doesnt find by name than goes by find by address
                find_by_rating_number(search) #if doenst find my address than goes by rating, really want to put find by comment somewhere her

                print "Press enter at any time to return to the Main Menu: "
                gets
            # when input!= "a" || "p" || "s"  I need to fix because brain not working
            #     prints "Sorry I didn't get that. Please try again"
            #     input
            when 'e'
                save #on exit that's when it saves to yaml file, maybe should split this up?
                reset_screen! #rest my screent again
                break #breaks the loop and the end 
            end
        end
    end
