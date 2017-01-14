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
    , referer     : String
    , route       : Routing.Route }

initialModel : Routing.Route -> String -> Model
initialModel route referer = { warehouses = []
                             , currentUser = CurrentUser "" ""
                             , user = LoginModel (User "" "") ""
                             , regUser = RegFormModel (Form.initial [] validate) [] (RegUser "" "" "" "" "" "")
                             , referer = referer
                             , route = route }
