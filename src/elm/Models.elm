module Models exposing (..)

import Form exposing (Form)
import Routing

import Components.Warehouses.Models exposing (Warehouse)
import Components.Login.Models      exposing (LoginModel, User, CurrentUser)
import Components.Register.Models   exposing (RegFormModel, RegUser, validate)

type alias Model =
    { warehouses  : List Warehouse
    , user        : LoginModel
    , currentUser : CurrentUser
    , regUser     : RegFormModel
    , route       : Routing.Route }

initialModel : Routing.Route -> Model
initialModel route = { warehouses = []
                     , currentUser = CurrentUser "" ""
                     , user = LoginModel (User "" "") ""
                     , regUser = RegFormModel (Form.initial [] validate) [] (RegUser "" "" "" "" "" "")
                     , route = route }
