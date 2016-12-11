module Components.Login.Update exposing (..)

import Components.Login.Messages exposing (Msg(..))
import Components.Login.Models exposing (..)
import Components.Login.Commands exposing (..)

update : Msg -> User -> ( User, Cmd Msg )
update message user = 
    case message of
        GoToLogin email password ->
            (user, logIn (User email password))

        Email email ->
            ( { user | email = email }, Cmd.none )

        Password password ->
            ( { user | password = password }, Cmd.none )

        OnLogIn (Ok user) ->
            ( user, Cmd.none )

        OnLogIn (Err error) ->
            ( user, Cmd.none )
