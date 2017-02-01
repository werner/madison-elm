module Components.Warehouses.Models exposing (..)

import Form exposing (Form)
import Translations.Utils exposing (TranslationId(..))
import Form.Validate as Validate exposing (..)
import Diyalog exposing (..)
import Diyalog.Message exposing (..)

type alias WarehouseId = String

type alias Warehouse = 
    { id     : Maybe WarehouseId
    , name   : String
    , stock  : Maybe Float }

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
    , stock  = Nothing
    }

validate : Validation TranslationId Warehouse
validate = 
    map3 Warehouse 
        (field "id" (maybe string))
        (field "name" string)
        (field "stock" (maybe float))

initialModel : (Diyalog.Message.Msg -> msg) -> WarehouseModel msg
initialModel msg = WarehouseModel
                       (Form.initial [] validate)
                       []
                       (Warehouse Nothing "" Nothing)
                       []
                       (Diyalog.initial msg)
