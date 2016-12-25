module Translations.FormErrors exposing (..)

import Form.Error exposing (ErrorValue(..))

import Translations.Utils exposing (..)

translateError : ErrorValue a -> String
translateError error =
    case error of
        InvalidEmail ->
            translate English ErrInvalidEmail

        Empty ->
            translate English ErrEmpty

        x ->
            toString x
