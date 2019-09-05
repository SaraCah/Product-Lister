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
            puts 'Products List Main Menu'
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
    def add_product  #adding product method
        reset_screen! #rests my screen
        product = Product.new #calls me product class

        puts "All products must have either a product name or company that produces it."
        print 'Product name: ' #asking user to put in product name
        product.label_name = gets.chomp
        print 'Type of product. Eg. Mascara, Facial Wash: ' #ask user to give type of project
        product.type_name = gets.chomp
        print 'Company name: ' #ask user to input compnay name
        product.company_name = gets.chomp

        if product.label_name == "" && product.company_name == "" #for some reason this is not working so need to figure this out
            return "Oops! That product didn't have product name or company name. Please try again." #ask about debugging because not showing
            add_product #loops back up to add product to do it right

        else
            loop do
                reset_screen! #gets to the next input i want the user to fo
                puts "Add rating number or location of where bought? "# option menu so user knows what to input
                puts "p: Add rating number" 
                puts "a: Add Address"
                puts "b: Back to Main Menu"

                input = gets.chomp.downcase #gets the user to put in p or a?
                case input
                when 'p' # if p
                    reset_screen!
                    rating = RatingNumber.new #is my rating class
                    print "Please provide some comments about the product eg. was drying to the skin: " #want the user to make a comment so they understnad why they rating it like it is
                    print ">" #just for formatting
                    rating.kind = gets.chomp #calls kind method from Ratingnumber class on rating input
                    print "Please give a number from 1-10 with 1 been the worst and 10 been the describe your product: "
                    rating.number = gets.chomp  #gets the number between 1-10
                    product.rating_numbers << rating #inserts the product rating number into the empty array on the RatingNumber class
                when 'a'
                    reset_screen!
                    address = Address.new #class the address class
                    print "Please provide an example of where you bought your product. Eg. Myer, Boutique, Sephora "
                    address.kind = gets.chomp #i wanted to set up a kind of store where the person bought it for clarity to them
                    print "Address line 1: " #next few lines is for full postal address
                    address.street_1 = gets.chomp
                    print "Address line 2: "
                    address.street_2 = gets.chomp
                    print "City: "
                    address.city = gets.chomp
                    print "State: "
                    address.state = gets.chomp
                    print "Postal Code: "
                    address.postal_code = gets.chomp
                    product.addresses << address #add the products address by calling address method and inserts it into empty address array
                when 'b'
                    break #b will break the loop and return to main menu
                end
            end
            products << product #adds product into product array
            puts "Product successfully added." #ok this line is not printing, don't know why but need to revist
        end

    end
    def find_by_rating_number(number)
        results  = []
        search = number.gsub('-','') #used gsub to find the - and replace with ''

        products.each do |product|
            product.rating_numbers.each do |rating_number|
                if rating_number.number.gsub('-','').include?(search) #same as above
                    results << product unless results.include?(product) #chucks the product into results
                end
            end
        end

        print_results("Rating search results (#{number}):", results) #returns the number and results
    end

    def find_by_address(query) #same as above if above fails goes to this
        results  = [] #empty array
        search = query.downcase #downcase

        products.each do |product|
            product.addresses.each do |address|
                if address.to_s('long').downcase.include?(search) 
                    results << product unless results.include?(product) #same as above for address
                end
            end
        end

        print_results("Address search results (#{query}):", results) #prints results
    end

    def print_label_list #method for printing list
        reset_screen! #reset the screen
        puts "Product List:"
        products.each do |product| 
            puts product.to_s('full_name') #returns full name so product, type and comapny
        end

        print "Press enter at any time to return to the Main Menu: "
        gets #makes any button return
    end

    def print_results(search, results)  #prints full results from the search method
        puts search #so basically when i have search for the prduct and program has found it i want to disaplay all other information about

        results.each do |product|
            puts product.to_s('full_name') #shoots out full name of product
            product.print_rating_numbers #shoots out the rating
            product.print_addresses #shoots out the addresses
            puts
        end
    end

end

address_book = ProductBook.new #make the program run
address_book.run