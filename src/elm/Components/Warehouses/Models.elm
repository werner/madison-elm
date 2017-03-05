module Components.Warehouses.Models exposing (..)

import Form exposing (Form)
import Translations.Utils exposing (TranslationId(..))
import Form.Validate as Validate exposing (..)
import Diyalog exposing (..)
import Diyalog.Message exposing (..)

type alias WarehouseId = Int

type alias Warehouse = 
    { id     : Maybe WarehouseId
    , name   : String
    }

type alias WarehouseModel msg =
    { form       : Form TranslationId Warehouse
    , errors     : List TranslationId 
    , warehouse  : Warehouse
    , warehouses : List Warehouse
    , modalForm  : Diyalog.Model msg
    }

new : Warehouse
new = 
    {
      id     = Nothing
    , name   = ""
    }

validate : Validation TranslationId Warehouse
validate = 
    map2 Warehouse 
        (field "id" (maybe int))
        (field "name" string)

initialModel : (Diyalog.Message.Msg -> msg) -> WarehouseModel msg
initialModel msg = WarehouseModel
                       (Form.initial [] validate)
                       []
                       (Warehouse Nothing "")
                       []
                       (Diyalog.initial msg)
