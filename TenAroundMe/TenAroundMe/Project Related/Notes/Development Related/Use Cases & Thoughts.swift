//
//  Use Cases & Thoughts.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
🟩 Create an application that allows the user to search (e.g. Cafe, Hotels, etc.) for the top 10 places closest to the user's current location.
 

         Thoughts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
• Get all the categories. User can either search within the categories or in autoSuggest.
• Sort the categories based on the relevance, probably you have to do this manually.
•
•
•
•
•
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

         Use-Cases
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
• Use-case 0: User just opened app.
   -> Use browse endpoint --> at & limit 10 --> will bring the most closest POI
       
       Use-case A: User will navigate pins or go to details.

       Use-case B: TODO: Think later

• Use-case 1: User tapped search.
 
    Do nothing.
 
 ~~~~~~~~~~~~~~~~~~~~~ Aborted Below ~~~~~~~~~~~~~~~~~~~~~
   --> Show the most relevent places that the user would choose, when no text input.

Restaurants, Cafes, Hotels, Gas Stations, Airports, Shopping Malls, Supermarkets, Pharmacies, Banks, Hospitals,
Parking Lots, Gyms/Fitness Centers, Parks, Movie Theaters, Car Rental Services, Public Restrooms, Museums, Libraries,
Beaches, Tourist Information Centers, Landmarks, Schools, Colleges/Universities, Train Stations, Bus Stops, Taxi Stands,
Subway Stations, Police Stations, Fire Stations, Post Offices, ATMs, Car Washes, Auto Repair Shops, Petrol Stations,
Camping Sites, Ski Resorts, Golf Courses, Sports Stadiums, Convention Centers, Amusement Parks, Zoos, Botanical Gardens,
Wineries, Hiking Trails, Marina/Boat Docks, Historical Sites, Art Galleries, Nightclubs, Spas, Bookstores, Fast Food,
Fine Dining, Vegetarian/Vegan Restaurants, Pizza Places, Sushi Restaurants, Breweries, Bars, Ice Cream Parlors,
Food Trucks, Indian Restaurants, Chinese Restaurants, Thai Restaurants, Mexican Restaurants, Italian Restaurants,
BBQ Restaurants, Seafood Restaurants, Dessert Shops, Brunch Spots, Breakfast Cafes, Buffet Restaurants,
Food Delivery Services, Wedding Venues, Event Spaces, Beauty Salons, Hairdressers, Nail Salons, Massage Therapy,
Yoga Studios, Pilates Studios, CrossFit Gyms, Boxing Gyms, Martial Arts Studios, Dance Studios, Live Music Venues,
Comedy Clubs, Theaters, Art Museums, Science Museums, Children's Museums, Botanical Parks, National Parks,
Wildlife Sanctuaries, Aquariums, Wineries/Vineyards, Beer Gardens, Historical Monuments, Architectural Landmarks,
Picnic Areas, Beach Resorts, Luxury Hotels.
 ~~~~~~~~~~~~~~~~~~~~~ Aborted Above ~~~~~~~~~~~~~~~~~~~~~

• Use-case 2: User started writing.
 
    --> Autosuggest response has a resultType so i will use that to show categories 
 ~~~~~~~~~~~~~~~~~~~~~ Aborted Below ~~~~~~~~~~~~~~~~~~~~~
   --> Segmented control for category <--> suggestion. For category have a exhaustive options to choose from.

        Use-case A: User is in category segment. Feed the tableview accordingly.

        Use-case B: User is in suggestion segment. Fee the tableview. * Initial State
 ~~~~~~~~~~~~~~~~~~~~~ Aborted Above ~~~~~~~~~~~~~~~~~~~~~
• Use-case 3: User wrote and searched.
   --> Browse endpoint --> at & name

• Use-case TODO: Think Later --> User pans the map, using bbox can fetch results --> would be nice

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  */
