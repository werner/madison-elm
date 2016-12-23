module Components.Register.Models exposing (..)

import Form exposing (Form)
import Form.Validate as Validate exposing (..)

type alias RegUser =
    { email                : String
    , password             : String
    , passwordConfirmation : String
    , firstName            : String
    , lastName             : String
    , companyName          : String }

type alias RegFormModel =
    { form : Form () RegUser
    , user : RegUser }

validate : Validation () RegUser
validate =
    map6 RegUser
        (field "email" email)
        (field "password" (string |> andThen nonEmpty))
        (field "passwordConfirmation" (string |> andThen nonEmpty))
        (field "firstName" (string |> andThen nonEmpty))
        (field "lastName" (string |> andThen nonEmpty))
        (field "companyName" (string |> andThen nonEmpty))
