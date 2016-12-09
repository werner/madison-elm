module Components.Login.Form exposing (..)

import Html exposing (..)
import Material.Scheme
import Material.Color as Color
import Material.Grid as Grid exposing (..) 
import Material.Button as Button exposing (render, onClick, raised)
import Material.Textfield as Textfield

import Components.Login.Messages exposing (..)
import Components.Login.Models exposing (..)

view : User -> Html Msg
view user = Material.Scheme.topWithScheme Color.Teal Color.LightGreen <|
    grid []
         [ cell [ Grid.size All 12 ] [ h1 [] [ text "Log In" ] ]
         , cell [ Grid.size All 12 ] [ 
             Html.form [] 
                 [ grid []
                        [ cell [ Grid.size All 8 ] 
                               [ Textfield.render Mdl [0] user.mdl 
                                  [ Textfield.label "Email"
                                  , Textfield.floatingLabel ] ]
                        , cell [ Grid.size All 8 ] 
                               [ Textfield.render Mdl [2] user.mdl 
                                  [ Textfield.label "Password"
                                  , Textfield.floatingLabel
                                  , Textfield.password ] ]
                        , cell [ Grid.size All 8 ] 
                               [ Button.render Mdl [3] user.mdl 
                                  [ Button.colored
                                  , Button.onClick ( GoToLogin user.email user.password ) ] [ text "Login" ] ] 
                        ]
                 ] 
             ]
         ]

