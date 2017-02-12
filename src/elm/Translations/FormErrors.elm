module Translations.FormErrors exposing (..)

import Form.Error exposing (ErrorValue(..))

import Translations.Utils exposing (..)

translateError : ErrorValue e -> String
translateError error =
    case error of
        InvalidEmail ->
            translate English ErrInvalidEmail

        Empty ->
            translate English ErrEmpty

        InvalidString ->
            translate English ErrInvalidString

        CustomError e ->
            case (toString e) of
                "PasswordNotMatch" ->
                    translate English PasswordNotMatch
                x ->
                    toString x

        x ->
            toString x
