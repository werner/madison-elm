module Components.Register.Models exposing (..)

import Form exposing (Form)
import Form.Error exposing (ErrorValue(..))
import Translations.Utils exposing (TranslationId(..))
import Form.Validate as Validate exposing (..)

type alias RegUser =
    { email                : String
    , password             : String
    , passwordConfirmation : String
    , firstName            : String
    , lastName             : String
    , companyName          : String }

type alias RegFormModel =
    { form   : Form String RegUser
    , errors : List (ErrorValue TranslationId)
    , user   : RegUser }

validate : Validation String RegUser
validate =
    map6 RegUser
        (field "email" email)
        (field "password" (string |> andThen nonEmpty))
        (field "passwordConfirmation" (string |> andThen nonEmpty))
        (field "firstName" (string |> defaultValue ""))
        (field "lastName" (string |> defaultValue ""))
        (field "companyName" (string |> defaultValue ""))
