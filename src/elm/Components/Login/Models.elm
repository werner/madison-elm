module Components.Login.Models exposing (..)

import Time exposing (..)

type alias User =
    { email     : String
    , password  : String
    , createdAt : Maybe String
    , updatedAt : Maybe String }
