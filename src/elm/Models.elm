module Models exposing (..)

import Form exposing (Form)
import Routing

import Components.Warehouses.Models as WarehouseModelC exposing (Warehouse, WarehouseModel, initialModel)
import Components.Login.Models      exposing (User, CurrentUser)
import Components.Register.Models   as RegisterModelC exposing (RegFormModel, RegUser, validate)
import Components.Warehouses.Messages as WarehouseMsg exposing (Msg(..))

type alias Model =
    { warehouseModel : WarehouseModel WarehouseMsg.Msg
    , user           : User
    , currentUser    : CurrentUser
    , regUser        : RegFormModel
    , referer        : String
    , isLocalStorage : Bool
    , route          : Routing.Route }

initialModel : Routing.Route -> String -> Model
initialModel route referer = { warehouseModel = WarehouseModelC.initialModel WarehouseMsg.DiyalogMsg
                             , currentUser    = CurrentUser "" ""
                             , user           = User "" ""
                             , regUser        = RegisterModelC.RegFormModel 
                                                    (Form.initial [] RegisterModelC.validate) 
                                                    [] 
                                                    (RegisterModelC.RegUser "" "" "" "" "" "")
                             , referer        = referer
                             , isLocalStorage = False
                             , route          = route }
