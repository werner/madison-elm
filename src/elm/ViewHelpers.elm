module ViewHelpers exposing (inputForm, errorFor, showErrors)

import Form exposing (Form, FieldState)
import Form.Error exposing (ErrorValue(..))
import Html exposing (..)
import Html.Attributes as Attr
import Html.CssHelpers

import Translations.FormErrors exposing (translateError)
import MainCss exposing (..)

{ id, class, classList } =
    Html.CssHelpers.withNamespace "madison"

inputForm
    : (FieldState e String -> List a -> Html msg)
    -> String
    -> String
    -> Form e o
    -> List (Html msg)
inputForm typeField field labelField form =
    [ div [ class [ InputField ], Attr.class "input-field" ] 
          [ typeField (Form.getFieldAsString field form) []
          , label [] [ text labelField ]
          , errorFor (Form.getFieldAsString field form) ]
    ]

errorFor : FieldState e String -> Html msg
errorFor field =
    case field.liveError of
        Just error ->
            div [ class [ ErrorMessage ] ] [ text (translateError error) ]

        Nothing ->
            text ""

showErrors : List (ErrorValue a) -> List (Html msg)
showErrors errors =
    List.map (\error -> div [ class [ ErrorMessage ] ] [ text (translateError error) ]) errors
