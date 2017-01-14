module Models exposing (..)

import Form exposing (Form)
import Routing

import Components.Warehouses.Models exposing (Warehouse)
import Components.Login.Models      exposing (User, CurrentUser)
import Components.Register.Models   exposing (RegFormModel, RegUser, validate)

type alias Model =
    { warehouses     : List Warehouse
    , user           : User
    , currentUser    : CurrentUser
    , regUser        : RegFormModel
    , referer        : String
    , isLocalStorage : Bool
    , route          : Routing.Route }

initialModel : Routing.Route -> String -> Model
initialModel route referer = { warehouses     = []
                             , currentUser    = CurrentUser "" ""
                             , user           = User "" ""
                             , regUser        = RegFormModel (Form.initial [] validate) [] (RegUser "" "" "" "" "" "")
                             , referer        = referer
                             , isLocalStorage = False
                             , route          = route }
