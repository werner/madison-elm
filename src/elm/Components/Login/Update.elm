module Components.Login.Update exposing (..)

import Navigation

import Components.Login.Messages exposing (Msg(..))
import Components.Login.Models   exposing (..)
import Components.Login.Commands exposing (..)

update : Msg -> LoginModel -> ( LoginModel, Cmd Msg )
update message ({ user, referer } as model) = 
    case message of
        GoToLogin email password referer ->
            ( model, logIn (LoginModel (User email password) referer) )

        GoToRegister ->
            ( model, Navigation.newUrl "#register" )

        Email email ->
            ( { model | user = User email user.password }, Cmd.none )

        Password password ->
            ( { model | user = User user.email password }, Cmd.none )

        OnLogIn referer user ->
            ( model, reloadTo referer )

reloadTo : String -> Cmd msg
reloadTo referer = 
    case referer of
        "" -> Navigation.newUrl "#dashboard"
        x  -> Navigation.newUrl x
