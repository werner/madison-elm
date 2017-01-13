module Components.Register.Update exposing (..)

import Form exposing (Form)
import Http

import Components.Register.Messages exposing (Msg(..))
import Components.Register.Models exposing (..)
import Components.Register.Commands exposing (..)

import Translations.Utils exposing (..)

update : Msg -> RegFormModel -> ( RegFormModel, Cmd Msg )
update message ({ form, errors, user } as model) = 
    case message of
        OnRegister (Ok user) ->
            ( model, Cmd.none )

        OnRegister (Err error) ->
            case error of
                Http.BadStatus err ->
                    ( { model | errors = [ HttpError err.status.message ] }, Cmd.none )
                _           ->
                    ( model, Cmd.none )


        FormMsg formMsg ->
            case ( formMsg, Form.getOutput form ) of
                ( Form.Submit, Just user ) ->
                    ( model, register user )

                _ ->
                    ( { model | form = Form.update formMsg form }, Cmd.none )
