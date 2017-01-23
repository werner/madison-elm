module Components.Warehouses.Models exposing (..)

import Html
import Form exposing (Form)
import Modal exposing (Model)
import Translations.Utils exposing (TranslationId(..))
import Form.Validate as Validate exposing (..)

type alias WarehouseId = String

type alias Warehouse = 
    { id     : Maybe WarehouseId
    , name   : String
    , stock  : Maybe Float }

type alias WarehouseModel =
    { form       : Form TranslationId Warehouse
    , errors     : List TranslationId 
    , warehouse  : Warehouse
    , warehouses : List Warehouse
    , modal      : Modal.Model Modal.Msg
    }

initialState : WarehouseModel
initialState = 
        WarehouseModel 
            (Form.initial [] validate)
            []
            (Warehouse Nothing "" Nothing)
            []
            ({ header = Html.div [] [ Html.text "" ]
            , body = Html.div [] [ Html.text "" ]
            , showDialog = False
            , okAction = Cmd.none })

validate : Validation TranslationId Warehouse
validate = 
    map3 Warehouse 
        (field "id" (maybe string))
        (field "name" string)
        (field "stock" (maybe float))

