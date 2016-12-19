module Components.Register.Update exposing (..)

import Components.Register.Messages exposing (Msg(..))
import Components.Register.Models exposing (..)
import Components.Register.Commands exposing (..)

update : Msg -> RegUser -> ( RegUser, Cmd Msg )
update message user = 
    case message of
        GoToRegister user ->
            (user, register user)

        Email email ->
            ( { user | email = email }, Cmd.none )

        Password password ->
            ( { user | password = password }, Cmd.none )

        PasswordConfirmation passwordConfirmation ->
            ( { user | passwordConfirmation = passwordConfirmation }, Cmd.none )

        FirstName firstName ->
            ( { user | firstName = firstName }, Cmd.none )

        LastName lastName ->
            ( { user | lastName = lastName }, Cmd.none )

        CompanyName companyName ->
            ( { user | companyName = companyName }, Cmd.none )

        OnRegister (Ok user) ->
            ( user, Cmd.none )

        OnRegister (Err error) ->
            ( user, Cmd.none )
