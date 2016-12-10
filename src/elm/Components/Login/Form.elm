module Components.Login.Form exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, src, type_)
import Html.Events exposing (onInput, onClick)
import Components.Login.Messages exposing (..)
import Components.Login.Models exposing (..)

view : User -> Html Msg
view user = 
    div [ class "container" ]
        [ div [ class "row" ]
                [ div [ class "col s8 l3 offset-l4" ] 
                      [ div [ class "card" ] 
                            [ div [ class "card-image" ] 
                                  [ img  [ src "static/img/logo.png" ] [] ] 
                            , div [ class "card-content" ]
                                  [ div [ class "input-field" ] 
                                        [ input [ type_ "text", onInput Email, class "validate" ] []
                                        , label [] [ text "Email" ] ]
                                  , div [ class "input-field" ] 
                                        [ input [ type_ "password", onInput Password, class "validate" ] [] 
                                        , label [] [ text "Password" ] ]
                                  ]
                            , div [ class "card-action" ]
                                  [ button [ class "btn", onClick ( GoToLogin user.email user.password ) ] [ text "Login" ] ]
                            ] 
                      ] 
                ]
        ]
