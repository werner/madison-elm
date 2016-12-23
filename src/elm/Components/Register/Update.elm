module Components.Register.Update exposing (..)

import Form exposing (Form)

import Components.Register.Messages exposing (Msg(..))
import Components.Register.Models exposing (..)
import Components.Register.Commands exposing (..)

update : Msg -> RegFormModel -> ( RegFormModel, Cmd Msg )
update message ({ form, user } as model) = 
    case message of
        GoToRegister user ->
            ( model, register user )

        OnRegister (Ok user) ->
            ( model, Cmd.none )

        OnRegister (Err error) ->
            ( model, Cmd.none )

        FormMsg formMsg ->
            ( { model | form = Form.update formMsg form }, Cmd.none )
