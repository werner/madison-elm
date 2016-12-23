module Models exposing (..)

import Form exposing (Form)
import Routing

import Components.Warehouses.Models exposing (Warehouse)
import Components.Login.Models      exposing (User)
import Components.Register.Models   exposing (RegFormModel, RegUser, validate)

type alias Model =
    { warehouses : List Warehouse
    , user       : User
    , regUser    : RegFormModel
    , route      : Routing.Route }

initialModel : Routing.Route -> Model
initialModel route = { warehouses = []
                     , user = User "" ""
                     , regUser = RegFormModel (Form.initial [] validate) (RegUser "" "" "" "" "" "")
                     , route = route }
