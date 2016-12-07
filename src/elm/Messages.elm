module Messages exposing (..)

import Navigation exposing (Location)
import Components.Warehouses.Messages

type Msg = WarehousesMsg Components.Warehouses.Messages.Msg
         | OnLocationChange Location
