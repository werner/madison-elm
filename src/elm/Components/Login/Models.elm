module Components.Login.Models exposing (..)

type alias User =
    { email    : String
    , password : String }

type alias CurrentUser =
    { id    : String
    , email : String }
