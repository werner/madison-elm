module Components.Login.Update exposing (..)

import Navigation

import Models   exposing (Model)
import Components.Login.Messages exposing (Msg(..))
import Components.Login.Models   exposing (..)
import Components.Login.Commands exposing (..)

import Json.Encode exposing (..)

import Ports.LocalStorage exposing (..) 

update : Msg -> Model -> ( Model, Cmd Msg )
update message model = 
    case message of
        GoToLogin ->
            ( model, logIn (User model.user.email model.user.password) )

        GoToRegister ->
            ( model, Navigation.newUrl "#register" )

        Email email ->
            ( { model | user = User email model.user.password }, Cmd.none )

        Password password ->
            ( { model | user = User model.user.email password }, Cmd.none )

        RememberMe value ->
            ( { model | isLocalStorage = value }, Cmd.none )

        KeyDown key ->
            if key == 13 then
                ( model, logIn (User model.user.email model.user.password) )
            else
                ( model, Cmd.none )

        OnLogIn (Ok user) ->
            ( model, Cmd.batch [ reloadTo model.referer, 
                                 saveStorage (
                                              object 
                                                 [ ("currentUser", 
                                                      object [ ("id",    string user.id)
                                                             , ("email", string user.email)
                                                             ]
                                                    )
                                                 ]
                                            , model.isLocalStorage ) 
                               ] )

        OnLogIn (Err user) ->
            ( model, reloadTo "#login" )

reloadTo : String -> Cmd msg
reloadTo referer = 
    case referer of
        ""       -> Navigation.newUrl "#dashboard"
        "#login" -> Navigation.newUrl "#dashboard"
        x        -> Navigation.newUrl x
