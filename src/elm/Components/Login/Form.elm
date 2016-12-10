module Components.Login.Form exposing (..)

import Html exposing (..)
import Material.Scheme
import Material.Color as Color
import Material.Grid as Grid exposing (..) 
import Material.Button as Button exposing (render, onClick, raised)
import Material.Textfield as Textfield
import Material.Card as Card
import Material.Options as Options exposing (cs, css)

import Components.Login.Messages exposing (..)
import Components.Login.Models exposing (..)


white : Options.Property c m 
white = 
  Color.text Color.white 

view : User -> Html Msg
view user = Material.Scheme.topWithScheme Color.Teal Color.LightGreen <| form user

form : User -> Html Msg
form user = 
    Card.view [ css "width" "256px" ] 
              [ Card.title
                  [ css "background" "url('static/img/logo.png') center / cover"
                  , css "height" "256px"
                  , css "padding" "0"
                  ] 
                  [ Card.head 
                      [ white 
                      , Options.scrim 0.75
                      , css "padding" "16px"
                      , css "width" "100%"
                      ]
                      [ text "Login" ]
                  ]
              , Card.actions []
                  [ Textfield.render Mdl [0] user.mdl 
                                  [ Textfield.label "Email"
                                  , Textfield.floatingLabel ] 
                  , Textfield.render Mdl [2] user.mdl 
                                  [ Textfield.label "Password"
                                  , Textfield.floatingLabel
                                  , Textfield.password ]
                  , Button.render Mdl [3] user.mdl 
                                  [ Button.colored
                                  , Button.onClick ( GoToLogin user.email user.password ) ] 
                                  [ text "Login" ]
                  ]
              ]
