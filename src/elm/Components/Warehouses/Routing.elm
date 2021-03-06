module Components.Warehouses.Routing exposing (..)

import Components.Warehouses.Models exposing (WarehouseId)
import UrlParser exposing (..)

type WarehouseRoute = WarehouseList
                    | WarehouseNew

matcherWarehouse : (WarehouseRoute -> b) -> List (Parser (b -> c) c)
matcherWarehouse route = [ map (route WarehouseList) (s "warehouses")
                         , map (route WarehouseNew) (s "warehouses" </> s "new")
                         ]
