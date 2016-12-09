module Components.Login.Models exposing (..)

import Material

type alias User =
    { mdl : Material.Model
    , email : String
    , password : String
    , passwordConfirmation : String }
