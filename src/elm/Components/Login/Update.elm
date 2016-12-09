module Components.Login.Update exposing (..)

import Material

import Components.Login.Messages exposing (Msg(..))
import Components.Login.Models exposing (..)

update : Msg -> User -> ( User, Cmd Msg )
update message user = 
    case message of
        GoToLogin email password ->
            ( User Material.model email password password, Cmd.none )

        Email email ->
            ( { user | email = email }, Cmd.none )

        Password password ->
            ( { user | password = password }, Cmd.none )

        PasswordConfirmation passwordConfirmation ->
            ( { user | passwordConfirmation = passwordConfirmation }, Cmd.none )

        Mdl msg ->
            Material.update msg user
