module ViewHelpers exposing (..)

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
    : (FieldState e String -> List (Attribute msg) -> Html msg)
    -> String
    -> String
    -> Form e o
    -> String
    -> List (Html msg)
inputForm typeField field labelField form value =
    [ div [ class [ InputField ], Attr.class "input-field" ] 
          [ typeField (Form.getFieldAsString field form) [ Attr.value value ]
          , label [ Attr.class <| setActiveIfValue value ] [ text labelField ]
          , errorFor (Form.getFieldAsString field form) ]
    ]

setActiveIfValue : String -> String
setActiveIfValue value = 
    if value == "" then "" else "active"

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

notFoundView : Html msg
notFoundView = 
    div []
        [ text "Url not found" ]

onLoadDiv : msg -> Attribute msg
onLoadDiv message =
  on "load" (Json.succeed message)
