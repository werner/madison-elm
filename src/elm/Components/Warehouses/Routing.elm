module Components.Warehouses.Routing exposing (..)

import Components.Warehouses.Models exposing (WarehouseId)
import UrlParser exposing (..)

type WarehouseRoute = WarehouseList
                    | WarehouseShow WarehouseId

matcherWarehouse : (WarehouseRoute -> b) -> List (Parser (b -> c) c)
matcherWarehouse route = [ map (\x -> route (WarehouseShow x)) (s "warehouses" </> string)
                         , map (route WarehouseList) (s "warehouses")
                         ]

