module Components.Login.Update exposing (..)

import Navigation

import Components.Login.Messages exposing (Msg(..))
import Components.Login.Models   exposing (..)
import Components.Login.Commands exposing (..)

import Json.Encode exposing (..)

import Ports.LocalStorage exposing (..) 

update : Msg -> LoginModel -> ( LoginModel, Cmd Msg )
update message ({ user, referer } as model) = 
    case message of
        GoToLogin ->
            ( model, logIn (LoginModel (User model.user.email model.user.password) model.referer) )

        GoToRegister ->
            ( model, Navigation.newUrl "#register" )

        Email email ->
            ( { model | user = User email user.password }, Cmd.none )

        Password password ->
            ( { model | user = User user.email password }, Cmd.none )

        OnLogIn referer (Ok user) ->
            ( model, Cmd.batch [ reloadTo referer, 
                                 saveStorage (
                                              object 
                                                 [ ("currentUser", 
                                                      object [ ("id",    string user.id)
                                                             , ("email", string user.email)
                                                             ]
                                                    )
                                                 ]
                                            ) 
                               ] )

        KeyDown key ->
            if key == 13 then
                ( model, logIn (LoginModel (User model.user.email model.user.password) referer) )
            else
                ( model, Cmd.none )

        OnLogIn referer (Err user) ->
            ( model, reloadTo "#login" )

reloadTo : String -> Cmd msg
reloadTo referer = 
    case referer of
        "" -> Navigation.newUrl "#dashboard"
        x  -> Navigation.newUrl x
