//
//  Endpoint.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~> Endpoints
                                                        
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          Discover 🟥
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 • ❗️ Processes a free-form text query for an address or place, and returns results in order of relevance.
 • 🔍 Params --> q & at & in & limit & route & lang & politicalView & show --> q & at are required
 •
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           Browse 🟩
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 • ❗️ Provides search results for places based on different filters, such as categories or name, ranked by distance from a given search center.
 • 🔍 Params --> at & in & categories & chains & foodTypes & name & limit & route & lang & politicalView & show --> at or in required
 •
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         LookUpById 🟩
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 • ❗️ Looks up a known place by the HERE ID included in the request.
 • 🔍 Params --> id & lang & politicalView & show
 •
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          Geocode 🟥
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 • ❗️ Allows to find the geo-coordinates of a known address, place, locality or administrative area, even if the query is incomplete or partly incorrect.
 • 🔍 Params --> q & qq & at & in & types & limit & lang & politicalView & show
 •
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        AutoSuggest 🟩
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 • ❗️ Suggests address or place candidates based on an incomplete or misspelled query, from which the user selects the best query to submit.
 • ❗️ Params --> q & at & in & termsLimit & route & limit & lang & politicalView & show
 •
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        AutoComplete 🟥
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 • ❗️ This endpoint completes the few entered keystrokes to the valid street address or administrative area to speed-up entering the address queries.
 • ❗️ Params --> q & at & in & types & limit & lang & politicalView & show
 •
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        ReverseGeocode 🟥
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 • ❗️ This endpoint returns the nearest address to geo coordinates specified in the request.
 • ❗️ Params --> at & in & types & limit & lang & politicalView & show
 •
 
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
