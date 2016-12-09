module Components.Login.Form exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Material.Grid as MG exposing (..) 

import Components.Login.Messages exposing (..)
import Components.Login.Models exposing (..)

view : User -> Html Msg
view user = 
    grid []
         [ cell [ MG.size All 12 ] [ h1 [] [ text "Log In" ] ]
         , cell [ MG.size All 12 ] [ 
             Html.form [] 
                 [ grid []
                        [ cell [ MG.size All 8 ] 
                               [ input [ type_ "text", placeholder "Email", onInput Email ] [] ]
                        , cell [ MG.size All 8 ] 
                               [ input [ type_ "password", placeholder "Password", onInput Password ] [] ]
                        , cell [ MG.size All 8 ] 
                               [ button [ class "btn", onClick ( GoToLogin user.email user.password ) ] 
                                        [ text "Login" ] ] 
                        ]
                 ] 
             ]
         ]

