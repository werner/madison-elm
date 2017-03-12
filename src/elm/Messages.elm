module Messages exposing (..)

import Navigation exposing (Location)
import Components.Warehouses.Messages
import Components.Login.Messages
import Components.Register.Messages

type Msg = WarehousesMsg Components.Warehouses.Messages.Msg
         | LoginMsg Components.Login.Messages.Msg
         | RegisterMsg Components.Register.Messages.Msg
         | OnLocationChange Location
         | LoadLocalStorage String
         | LoadScrollAction (String, Int)
