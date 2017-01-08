module Components.Login.Models exposing (..)

type alias User =
    { email    : String
    , password : String }

type alias CurrentUser =
    { id    : String
    , email : String }

type alias LoginModel =
    { user    : User 
    , referer : String }
