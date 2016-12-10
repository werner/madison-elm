module Components.Login.Form exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Components.Login.Messages exposing (..)
import Components.Login.Models exposing (..)

view : User -> Html Msg
view user = 
    div [ class "m3" ]
        [ h1 [] [ text "Log In" ]
        , Html.form [] 
        [ input [ type_ "text", placeholder "Email", onInput Email ] []
        , input [ type_ "password", placeholder "Password", onInput Password ] []
        , button [ class "btn", onClick ( GoToLogin user.email user.password ) ] [ text "Login" ] ] ]
