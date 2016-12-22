module Components.Register.Form exposing (..)

import Html exposing (..)
import Html.Attributes as Attr
import Html.Events exposing (onInput, onClick)
import Html.CssHelpers

import MainCss exposing (..)
import Components.Register.Messages exposing (..)
import Components.Register.Models exposing (..)

{ id, class, classList } =
    Html.CssHelpers.withNamespace "madison"

view : RegUser -> Html Msg
view user = 
    div [ Attr.class "container" ]
        [ div [ Attr.class "row" ]
                [ div [ Attr.class "col s12 l6 offset-l3" ] 
                      [ div [ Attr.class "card-panel" ] 
                            [ div [ Attr.class "row center valign-wrapper" ]
                                  [ div [ Attr.class "col s2"] [ img  [ Attr.src "static/img/logo-nav.png" ] [] ]
                                  , div [ Attr.class "col s10 left-align "] [ div  [] [ h2 [] [ text "Register" ] ] ] ]
                            , div [ Attr.class "row" ]
                                  [ div [ class [ InputField ], Attr.class "input-field" ] 
                                        [ input [ Attr.type_ "text", onInput Email, Attr.class "validate" ] []
                                        , label [] [ text "Email" ] ]
                                  ]
                            , div [ Attr.class "row" ]
                                  [ div [ class [ InputField ], Attr.class "input-field" ] 
                                        [ input [ Attr.type_ "password", onInput Password, Attr.class "validate" ] [] 
                                        , label [] [ text "Password" ] ]
                                  ]
                            , div [ Attr.class "row" ]
                                  [ div [ class [ InputField ], Attr.class "input-field" ] 
                                        [ input [ Attr.type_ "password", 
                                                  onInput PasswordConfirmation, Attr.class "validate" ] [] 
                                        , label [] [ text "Password Confirmation" ] ]
                                  ]
                            , div [ Attr.class "row" ]
                                  [ div [ class [ InputField ], Attr.class "input-field" ] 
                                        [ input [ Attr.type_ "text", onInput FirstName, Attr.class "validate" ] []
                                        , label [] [ text "First Name" ] ]
                                  ]
                            , div [ Attr.class "row" ]
                                  [ div [ class [ InputField ], Attr.class "input-field" ] 
                                        [ input [ Attr.type_ "text", onInput LastName, Attr.class "validate" ] []
                                        , label [] [ text "Last Name" ] ]
                                  ]
                            , div [ Attr.class "row" ]
                                  [ div [ class [ InputField ], Attr.class "input-field" ] 
                                        [ input [ Attr.type_ "text", onInput CompanyName, Attr.class "validate" ] []
                                        , label [] [ text "Company Name" ] ]
                                  ]
                            , div [ Attr.class "row" ]
                                  [ button [ Attr.class "btn waves-effect waves-light col s12"
                                           , onClick ( GoToRegister user ) ] [ text "Register" ] ]
                            ] 
                      ] 
                ]
        ]
