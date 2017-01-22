module Components.Warehouses.Messages exposing (..)

import Http
import Form exposing (Form)
import Components.Warehouses.Models exposing ( WarehouseId, Warehouse )

type Msg = OnFetchAll (Result Http.Error (List Warehouse))
         | ShowWarehouses
         | ShowWarehouse WarehouseId
         | GotoNewWarehouse
         | ChangeWarehouse WarehouseId String
         | OnSave (Result Http.Error Warehouse)
         | FormMsg Form.Msg
