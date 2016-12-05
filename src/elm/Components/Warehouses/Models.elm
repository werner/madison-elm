module Components.Warehouses.Models exposing (..)

type alias WarehouseId = String

type alias Warehouse = 
    { id     : WarehouseId
    , name   : String
    , userId : Int 
    , stock  : Float }

loggedInUser : Int
loggedInUser = 0

new : Warehouse
new = 
    {
        id     = "0"
    ,   name   = ""
    ,   userId = loggedInUser
    ,   stock  = 0
    }
