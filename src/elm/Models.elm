module Models exposing (..)

import Form exposing (Form)
import Routing

import Components.Warehouses.Models as WarehouseModelC exposing (Warehouse, WarehouseModel, validate)
import Components.Login.Models      exposing (User, CurrentUser)
import Components.Register.Models   as RegisterModelC exposing (RegFormModel, RegUser, validate)

type alias Model =
    { warehouseModel : WarehouseModel
    , user           : User
    , currentUser    : CurrentUser
    , regUser        : RegFormModel
    , referer        : String
    , isLocalStorage : Bool
    , route          : Routing.Route }

initialModel : Routing.Route -> String -> Model
initialModel route referer = { warehouseModel = WarehouseModelC.WarehouseModel 
                                                    (Form.initial [] WarehouseModelC.validate)
                                                    []
                                                    (WarehouseModelC.Warehouse "" "" 0.0)
                                                    []
                             , currentUser    = CurrentUser "" ""
                             , user           = User "" ""
                             , regUser        = RegisterModelC.RegFormModel 
                                                    (Form.initial [] RegisterModelC.validate) 
                                                    [] 
                                                    (RegisterModelC.RegUser "" "" "" "" "" "")
                             , referer        = referer
                             , isLocalStorage = False
                             , route          = route }
