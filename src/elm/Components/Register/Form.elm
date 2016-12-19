module Components.Register.Form exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, src, type_, id, for, href)
import Html.Events exposing (onInput, onClick)
import Components.Register.Messages exposing (..)
import Components.Register.Models exposing (..)

view : RegUser -> Html Msg
view user = 
    div [ class "container" ]
        [ div [ class "row" ]
                [ div [ class "col s12 l6 offset-l3" ] 
                      [ div [ class "card-panel" ] 
                            [ div [ class "row center valign-wrapper" ]
                                  [ div [ class "col s2"] [ img  [ src "static/img/logo-nav.png" ] [] ]
                                  , div [ class "col s10 left-align "] [ div  [] [ h2 [] [ text "Register" ] ] ] ]
                            , div [ class "row" ]
                                  [ div [ class "input-field" ] 
                                        [ input [ type_ "text", onInput Email, class "validate" ] []
                                        , label [] [ text "Email" ] ]
                                  ]
                            , div [ class "row" ]
                                  [ div [ class "input-field" ] 
                                        [ input [ type_ "password", onInput Password, class "validate" ] [] 
                                        , label [] [ text "Password" ] ]
                                  ]
                            , div [ class "row" ]
                                  [ div [ class "input-field" ] 
                                        [ input [ type_ "password", 
                                                  onInput PasswordConfirmation, class "validate" ] [] 
                                        , label [] [ text "Password Confirmation" ] ]
                                  ]
                            , div [ class "row" ]
                                  [ div [ class "input-field" ] 
                                        [ input [ type_ "text", onInput FirstName, class "validate" ] []
                                        , label [] [ text "First Name" ] ]
                                  ]
                            , div [ class "row" ]
                                  [ div [ class "input-field" ] 
                                        [ input [ type_ "text", onInput LastName, class "validate" ] []
                                        , label [] [ text "Last Name" ] ]
                                  ]
                            , div [ class "row" ]
                                  [ div [ class "input-field" ] 
                                        [ input [ type_ "text", onInput CompanyName, class "validate" ] []
                                        , label [] [ text "Company Name" ] ]
                                  ]
                            , div [ class "row" ]
                                  [ button [ class "btn waves-effect waves-light col s12"
                                           , onClick ( GoToRegister user ) ] [ text "Register" ] ]
                            ] 
                      ] 
                ]
        ]
