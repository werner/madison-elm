module ViewHelpers exposing (inputForm, errorFor, showErrors, onKeyDown)

import Form exposing (Form, FieldState)
import Html exposing (..)
import Html.Events exposing (keyCode, on)
import Json.Decode as Json
import Html.Attributes as Attr
import Html.CssHelpers

import Translations.FormErrors exposing (translateError)
import Translations.Utils exposing (TranslationId(..), Language(..), translate)
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

showErrors : List TranslationId -> List (Html msg)
showErrors errors =
    List.map (\error -> div [ class [ ErrorMessage ] ] [ text (translate English error) ]) errors

onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown tagger =
  on "keydown" (Json.map tagger keyCode)
