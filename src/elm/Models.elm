module Models exposing (..)

import Components.Warehouses.Models exposing (Warehouse)
import Components.Login.Models      exposing (User)
import Components.Register.Models   exposing (RegUser)
import Routing

type alias Model =
    { warehouses : List Warehouse
    , user       : User
    , regUser    : RegUser
    , route      : Routing.Route }

initialModel : Routing.Route -> Model
initialModel route = { warehouses = []
                     , user = User "" ""
                     , regUser = RegUser "" "" "" "" "" ""
                     , route = route }
