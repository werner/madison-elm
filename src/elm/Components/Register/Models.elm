module Components.Register.Models exposing (..)

import Form exposing (Form)
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
    { form   : Form TranslationId RegUser
    , errors : List TranslationId
    , user   : RegUser }

validate : Validation TranslationId RegUser
validate =
    map6 RegUser
        (field "email" email)
        (field "password" (string |> andThen nonEmpty))
        ((field "password" string) |> andThen validateConfirmation)
        (field "firstName" (string |> defaultValue ""))
        (field "lastName" (string |> defaultValue ""))
        (field "companyName" (string |> defaultValue ""))

validateConfirmation : String -> Validation TranslationId String
validateConfirmation password =
    field "passwordConfirmation"
        (string
            |> andThen
                (\confirmation ->
                    if password == confirmation then
                        succeed confirmation
                    else
                        fail (customError PasswordNotMatch)
                )
        )
