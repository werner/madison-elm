module Components.Register.Models exposing (..)

type alias RegUser =
    { email                : String
    , password             : String
    , passwordConfirmation : String
    , firstName            : String
    , lastName             : String
    , companyName          : String }
