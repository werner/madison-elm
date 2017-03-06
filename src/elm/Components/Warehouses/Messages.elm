module Components.Warehouses.Messages exposing (..)

import Http
import Form exposing (Form)
import Diyalog.Message
import Components.Warehouses.Models exposing ( WarehouseId, Warehouse )

type Msg = OnFetchAll (Result Http.Error (List Warehouse))
         | ShowWarehouses String
         | ShowWarehouse (Maybe WarehouseId)
         | ChangeWarehouse (Maybe WarehouseId) String
         | OnSave String (Result Http.Error ())
         | FormMsg Form.Msg
         | DiyalogMsg Diyalog.Message.Msg
