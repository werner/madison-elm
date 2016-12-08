module Routing exposing (..)

import Navigation exposing (Location)
import Components.Warehouses.Models exposing (WarehouseId)
import UrlParser exposing (..)

type Route = LoginRoute
           | WarehousesRoute
           | WarehouseRoute WarehouseId
           | NotFoundRoute

matchers : Parser (Route -> a) a
matchers = oneOf
         [ map LoginRoute (s "login")
         , map WarehouseRoute (s "warehouses" </> string)
         , map WarehousesRoute (s "warehouses")
         ]

parseLocation : Location -> Route
parseLocation location = 
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing   ->
            NotFoundRoute
