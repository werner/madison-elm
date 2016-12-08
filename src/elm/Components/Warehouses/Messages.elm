module Components.Warehouses.Messages exposing (..)

import Http
import Components.Warehouses.Models exposing ( WarehouseId, Warehouse )

type Msg = OnFetchAll (Result Http.Error (List Warehouse))
         | ShowWarehouses
         | ShowWarehouse WarehouseId
         | ChangeWarehouse WarehouseId String
         | OnSave (Result Http.Error Warehouse)
