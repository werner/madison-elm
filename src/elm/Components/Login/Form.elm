module Components.Login.Form exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, src, type_, id, for, href)
import Html.Events exposing (onInput, onClick)
import Components.Login.Messages exposing (..)
import Components.Login.Models exposing (..)

view : User -> Html Msg
view user = 
    div [ class "container" ]
        [ div [ class "row" ]
                [ div [ class "col s12 l3 offset-l4" ] 
                      [ div [ class "card-panel" ] 
                            [ div [ class "row center" ]
                                  [ div [ class "col s12"] [ img  [ src "static/img/logo-small.png" ] [] ]
                                  , div [ class "col s12"] [ div  [] [ text "MADISON ERP" ] ] ]
                            , div [ class "row" ]
                                  [ div [ class "input-field" ] 
                                        [ i [ class "form-login-icon material-icons prefix" ] [ text "perm_identity" ]
                                        , input [ type_ "text", onInput Email, class "validate" ] []
                                        , label [] [ text "Email" ] ]
                                  ]
                            , div [ class "row" ]
                                  [ div [ class "input-field" ] 
                                        [ i [ class "form-login-icon material-icons prefix" ] [ text "lock_outline" ]
                                        , input [ type_ "password", onInput Password, class "validate" ] [] 
                                        , label [] [ text "Password" ] ]
                                  ]
                            , div [ class "row" ]
                                  [ div [ class "input-field" ] 
                                        [ input [ type_ "checkbox", id "remember-me" ] []
                                        , label [ for "remember-me" ] [ text "Remember me" ] ]
                                  ]
                            , div [ class "row" ]
                                  [ button [ class "btn waves-effect waves-light col s12"
                                           , onClick ( GoToLogin user.email user.password ) ] [ text "Login" ] ]
                            , div [ class "row" ]
                                  [ div [ class "col s5" ] [ a [ href "#" ] [ text "Register Now!" ] ]
                                  , div [ class "col s7 right-align" ] [ a [ href "#" ] [ text "Forgot password?" ] ]
                                  ]
                            ] 
                      ] 
                ]
        ]
