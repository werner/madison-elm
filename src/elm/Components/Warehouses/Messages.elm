module Components.Warehouses.Messages exposing (..)

import Http
import Form exposing (Form)
import Modal exposing (Msg)
import Components.Warehouses.Models exposing ( WarehouseId, Warehouse )

type Msg = OnFetchAll (Result Http.Error (List Warehouse))
         | ShowWarehouses
         | ShowWarehouse (Maybe WarehouseId)
         | GotoNewWarehouse
         | ChangeWarehouse (Maybe WarehouseId) String
         | OnSave (Result Http.Error Warehouse)
         | FormMsg Form.Msg
         | ModalMsg Modal.Msg
