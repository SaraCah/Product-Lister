# Statement of Purpose and Scope

Personally for me, I am a skin care/cosmetics addict. However, I fall straight into the trap of buying too many things. I feel as soon as I see something new with somewhat ok reviews, I scramble to buy it while forgetting why I love my old products so much.

I have built this terminal application to stop myself from buying too many things. It’s safe to say the target audience is for people like me who have problems spending and not appreciating the items they currently own. I have created this terminal application for me to store the products I love so much or perhaps hate so when the time comes to buy again, I can look at my list and decide whether it is worth buying the same product again or maybe trying something new to add to my list. It is also to have a searchable data-base to be able to find products that I hold so near and dear to my heart.

# Features

This first feature this application has is adding a product that I want to add to my list. For good categorisation I have added three variables the user can input for the product. The 3 being, the label name, product type, and the company name. For example if I had the Revitalift eye cream from Revlon the label name would = Revitalift, product type = eye cream and company name = Revlon. The reason these variables were added were to help the search feature which will I go into further detail with later but also just for me to remember these small things in case I want to go to the chemist and have forgotten what I even bought.


The next feature of this application nested underneath adding a product is the ability to add some comments and a rating about the product.  For me, for some reason, I tend to forget why I like a product in the first place. So what happens is I go in store and get blinded by bright lights and immediately want to buy something new. I added this feature so a user can solidify in their head why they like a product so much. In this feature a user can input some comments and than a number to imply how much or how little they actually like a product

The next feature nested under adding the product is putting the address of where I found the product. For skin care personally I tend to go for organic indie brands and sometimes forget where I bought it. This feature was added so the user can add the address of where they bought the product in the case of it’s a very rare place.

One of the main features is to print the contents of the Products users have store. This was added so users can just have a look at what they have tried so far.

The last feature added was the ability to search the product list. When a user wants to search for a product, if many products are added to the list going through the printed list can be tedious so a feature just to be able to search by say product name or where it was bought was added to make things faster.

# User Interaction and Experience
When the program runs the user will be presented with a starting menu with the options

The user will enter their options by typing in “a” to add product, “p” to print list or “s” to search product. For the time being there is no other option if say the user types in something else but for now  but I will need to implement it in the future. If the user inputs an invalid value I want the program to say “Wrong input please try again” and loop it so the user inputs again.

If user goes into add product the user will be prompted to add the product name, product type and the company that produces it. I wanted to at least have the user input the product name and company to make searching easier in the future. If user does not input product name and company they will be prompted to try again to add the features.

After this information is added, user will have the option to add the rating for the product or the address of where they purchased such product.

If rating number is added by pressing p user will be prompted to give some comments about the product and give a number to rate it. After this input is added it will loop back to the previous screen and the user can add an address of where they bought it.

Adding an address involves user inputting various variables such as kind (so if the user bought from a department store, indie shop) , street 1 , street 2, city, state and postal code. This can help the user be able to find where product was bought if say the product was bought from an organic skin care shop somewhere in the countryside. Another option I considered further developing was if user bought online, for the user to input the web address but that is something I didn’t quite and will revise to improve.

After this input the user will loop back to the main menu and the users data will be saved as a .yml file for future reference. If an input that is not an option is entered, the user will be prompted to enter a different option. I tried to make it print a message saying “Sorry I don’t quite get that please try again” back to user but at the moment it isn’t working so it will require further debugging.

When a user goes back to main menu they can now print their product list. If the user inputs the option for product list it will now print the product, their rating and where they bought it. The user can then press any button to return back to main menu.

From main menu the user has the option to search for a product they entered. The user can search by any information they have added and it will return the Product that contains that input. For example if the user searches for Revlon from our previous examples it will return the list of that products properties to help find it. For the future I want to add a way to search using the comments. For example if I rated by product a 9 and made a comment that it’s drying, I still have no way to search for that so it’s something that I will try to implement in the future.

