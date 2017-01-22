module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)

import Components.Warehouses.Routing exposing (WarehouseRoute(..), matcherWarehouse)

type Route = LoginRoute
           | RegisterRoute
           | NotFoundRoute
           | WarehouseRoutes WarehouseRoute

matchers : Parser (Route -> a) a
matchers = oneOf
         ([ map LoginRoute      (s "login")
          , map RegisterRoute   (s "register")
          ] ++ matcherWarehouse WarehouseRoutes)

parseLocation : Location -> Route
parseLocation location = 
    case (parseHash matchers location) of
        Just route ->
            route
        Nothing   ->
            NotFoundRoute
