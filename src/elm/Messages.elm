module Messages exposing (..)

import Navigation exposing (Location)
import Components.Warehouses.Messages
import Components.Login.Messages

type Msg = WarehousesMsg Components.Warehouses.Messages.Msg
         | LoginMsg Components.Login.Messages.Msg
         | OnLocationChange Location
