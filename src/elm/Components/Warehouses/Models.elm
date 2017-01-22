module Components.Warehouses.Models exposing (..)

import Form exposing (Form)
import Translations.Utils exposing (TranslationId(..))
import Form.Validate as Validate exposing (..)

type alias WarehouseId = String

type alias Warehouse = 
    { id     : WarehouseId
    , name   : String
    , stock  : Float }

type alias WarehouseModel =
    { form       : Form TranslationId Warehouse
    , errors     : List TranslationId 
    , warehouse  : Warehouse
    , warehouses : List Warehouse
    }

new : Warehouse
new = 
    {
      id     = "0"
    , name   = ""
    , stock  = 0
    }

validate : Validation TranslationId Warehouse
validate = 
    map3 Warehouse 
        (field "id" string)
        (field "name" string)
        (field "stock" float)

