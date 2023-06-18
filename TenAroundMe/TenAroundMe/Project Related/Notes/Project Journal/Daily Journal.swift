//
//  Project Journal.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 13.06.2023.
//

// ❗️ This is file is for note taking.

/*
 
 June - 13 --> 5 PM --> Case Given
 ~~~~~~~~~~~~~~~~~~~

 
 • The design guidelines of prominent platforms such as TripAdvisor, Airbnb, and Foursquare
 were examined and analyzed to gather insights and inspiration for UI/UX ideation.
 
 • Before implementing the project, a detailed examination of the API was carried out to understand
 its capabilities. This investigation aimed to determine the scope of the API and how it could meet
 the project's requirements.
 
 • The app's user interface is designed using Figma to ensure a consistent and guided approach
 throughout the development process. Started today.
 
 • Started to gain familiarity with the MapKit SDK to effectively incorporate it into the project.
 At the moment do not know its capabilities, it will be a learning challange.
 
 • Applied a folder structure to ease the organizational debt.
 
 • Analyzed the development scope and made decisions to optimize time and progress in the project.
 Strategy is to meet the minimum requirements of the project then improving upon it with time.
 
 June - 14
 ~~~~~~~~~~~~~~~~~~~
 
 • https://places.demo.api.here.com/places/v1/discover/search?at=52.521%2C13.3807&q=Hotel&Accept-Language=en-US%2Cen%3Bq%3D0.9&app_id=DemoAppId01082013GAL&app_code=AJKnXv84fjrb0KIHawS0Tg --> gives 503 server error with demo credidentials
 • https://places.demo.api.here.com/places/v1/discover/search?at=52.521%2C13.3807&q=Hotel&Accept-Language=en-US%2Cen%3Bq%3D0.9&app_id=LWPPa0JZmufjR0KEkMvq&app_code=kWzzhVDnJWFiQLawPbeqWfpeR0Utw1vlC5kcF54wIUU --> gives 403 Invalid app_id app_code combination
 
 • https://developer.here.com/documentation/places/dev_guide/topics/quick-start-find-text-string.html --> at the moment states that the API
 is in maintenance, suggests to migrate to HERE Geocoding & Search API v7
 
 • https://developer.here.com/documentation/geocoding-search-api/migration_guide/index.html --> states a migration guide to new API support

 • https://status.here.com/status --> seems no problem with Places API on the status information page
 
 • https://stackoverflow.com/questions/76152182/here-geocoder-api-authentication-problem --> the problem that i face
 
 • https://discover.search.hereapi.com/v1/discover?at=39.9091,32.8618&q=hotels&limit=10&apiKey=kWzzhVDnJWFiQLawPbeqWfpeR0Utw1vlC5kcF54wIUU
 --> retrieves the results ✅
 
 • Contacted HR about the authentication problem that i faced with the API, will continue with the HERE Geocoding & Search API v7
 
 • https://www.figma.com/file/tsx9RdcBTjiWwRT5ix2Sk0/TenAroundMe?type=design&node-id=0%3A1&t=kVN0q9PE2JfaUTDj-1 --> Finalized UI Design (Public)
 
 • https://developer.here.com/documentation/geocoding-search-api/api-reference-swagger.html --> swagger here
 
 June - 15
 ~~~~~~~~~~~~~~~~~~~
 
 • Read the Guide and API reference, thought about what and how to use the API.
 
 • Did the postman collection to test the api capabilities, added to the project as a public link.
 
 • ❗️ Matt Austin --> Reached to me about the technical problem that i had with API key and API.
 
 • The uncertainty cost me time so i will just continue with the HERE Geocoding & Search API v7.
 
 • Starting the implementation before its too late ❗️
 
 June - 16
 ~~~~~~~~~~~~~~~~~~~
 • Started the implementation.
 
 • Joined to the Slack channel and asked about the API related problem. The API key does not authenticate requests for the demo places api.
 
 • After analyzing the HERE_Geocoding_Search_API_v7 decided to take the initiative to continue with it. Emailed HR no notify.
 
 • Added MVVM boilerplates.
 
 
 June - 17
 ~~~~~~~~~~~~~~~~~~~
 
 • Added a custom implementation for the top sheet.
 
 • Had paning related problems.
 
 • Will simplify the approach by aborting the top sheet approach, will continue with UISearchController.
 
 • The design choices i made is causing efforts.
 
 • Search UI is added.
 
 • Started to assemble the Network Layer.
 
 • I will use URLSessions for fetching.
 
 • ❗️ Got no response for the API related situation that i faced, so i will just continue.

 June - 18
 ~~~~~~~~~~~~~~~~~~~
 
 • Implemented network layer.
 
 • Implemented auto-suggestion feature.
 
 • MVVM flow cycle is established.
 
 •
 
 
*/
