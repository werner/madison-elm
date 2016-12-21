module Components.Login.Form exposing (..)

import Html exposing (..)
import Html.Attributes as Attr
import Html.Events exposing (onInput, onClick)
import Html.CssHelpers

import Components.Login.Messages exposing (..)
import Components.Login.Models exposing (..)

import MainCss exposing (..)
import Components.Login.Css exposing (..)

{ id, class, classList } =
    Html.CssHelpers.withNamespace "madison"

view : User -> Html Msg
view user = 
    div [ Attr.class "container" ]
        [ div [ Attr.class "row" ]
                [ div [ Attr.class "col s12 l3 offset-l4" ] 
                      [ div [ Attr.class "card-panel" ] 
                            [ div [ Attr.class "row center" ]
                                  [ div [ Attr.class "col s12"] [ img  [ Attr.src "static/img/logo-small.png" ] [] ]
                                  , div [ Attr.class "col s12"] [ div  [] [ text "MADISON ERP" ] ] ]
                            , div [ Attr.class "row" ]
                                  [ div [ class [ InputField ], Attr.class "input-field" ] 
                                        [ i [ class [ LoginIcon ], Attr.class "material-icons prefix" ] [ text "perm_identity" ]
                                        , input [ Attr.type_ "text", onInput Email, Attr.class "validate" ] []
                                        , label [] [ text "Email" ] ]
                                  ]
                            , div [ Attr.class "row" ]
                                  [ div [ class [ InputField ], Attr.class "input-field" ] 
                                        [ i [ class [ LoginIcon ], Attr.class "material-icons prefix" ] [ text "lock_outline" ]
                                        , input [ Attr.type_ "password", onInput Password, Attr.class "validate" ] [] 
                                        , label [] [ text "Password" ] ]
                                  ]
                            , div [ Attr.class "row" ]
                                  [ div [ Attr.class "input-field" ] 
                                        [ input [ Attr.type_ "checkbox", Attr.id "remember-me" ] []
                                        , label [ Attr.for "remember-me" ] [ text "Remember me" ] ]
                                  ]
                            , div [ Attr.class "row" ]
                                  [ button [ Attr.class "btn waves-effect waves-light col s12"
                                           , onClick ( GoToLogin user.email user.password ) ] [ text "Login" ] ]
                            , div [ Attr.class "row" ]
                                  [ div [ Attr.class "col s5" ] [ a [ class [ RegularLink ],
                                                                      onClick GoToRegister ] 
                                                                    [ text "Register Now!" ] ]
                                  , div [ Attr.class "col s7 right-align" ] [ a [ class [ RegularLink ], 
                                                                                  Attr.href "#" ] 
                                                                                [ text "Forgot password?" ] ]
                                  ]
                            ] 
                      ] 
                ]
        ]
