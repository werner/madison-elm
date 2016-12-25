module Components.Register.Form exposing (..)

import Html exposing (..)
import Html.Attributes as Attr
import Html.Events exposing (onInput, onClick)
import Html.CssHelpers
import Form exposing (Form, FieldState)
import Form.Input as Input

import MainCss exposing (..)
import Translations.FormErrors exposing (translateError)
import Components.Register.Messages exposing (..)
import Components.Register.Models exposing (..)

{ id, class, classList } =
    Html.CssHelpers.withNamespace "madison"

view : RegFormModel -> Html Msg
view model = Html.map FormMsg (form model)

form : RegFormModel -> Html Form.Msg
form ({ form, user } as model) = 
    div [ Attr.class "container" ]
        [ div [ Attr.class "row" ]
                [ div [ Attr.class "col s12 l6 offset-l3" ] 
                      [ div [ Attr.class "card-panel" ] 
                            [ div [ Attr.class "row center valign-wrapper" ]
                                  [ div [ Attr.class "col s2"] [ img  [ Attr.src "static/img/logo-nav.png" ] [] ]
                                  , div [ Attr.class "col s10 left-align "] [ div  [] [ h2 [] [ text "Register" ] ] ] ]
                            , div [ Attr.class "row" ] (inputForm Input.textInput "email" "Email" form)
                            , div [ Attr.class "row" ] (inputForm Input.passwordInput "password" "Password" form)
                            , div [ Attr.class "row" ] (inputForm Input.passwordInput 
                                                                  "passwordConfirmation" 
                                                                  "Password Confirmation" form)
                            , div [ Attr.class "row" ] (inputForm Input.textInput "firstName" "First Name" form)
                            , div [ Attr.class "row" ] (inputForm Input.textInput "lastName" "Last Name" form)
                            , div [ Attr.class "row" ] (inputForm Input.textInput 
                                                                  "companyName" "Company Name" form)
                            , div [ Attr.class "row" ]
                                  [ button [ Attr.class "btn waves-effect waves-light col s12"
                                           , onClick Form.Submit ] [ text "Register" ] ]
                            ] 
                      ] 
                ]
        ]

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
