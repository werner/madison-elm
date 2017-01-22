module Components.Warehouses.Models exposing (..)

import Form exposing (Form)
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
    }

new : Warehouse
new = 
    {
      id     = Nothing
    , name   = ""
    , stock  = Nothing
    }

validate : Validation TranslationId Warehouse
validate = 
    map3 Warehouse 
        (field "id" (maybe string))
        (field "name" string)
        (field "stock" (maybe float))

