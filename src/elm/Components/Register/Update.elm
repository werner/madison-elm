module Components.Register.Update exposing (..)

import Form exposing (Form)
import Translations.Utils exposing (TranslationId(..), uniqErrors)

import Components.Register.Messages exposing (Msg(..))
import Components.Register.Models exposing (..)
import Components.Register.Commands exposing (..)

update : Msg -> RegFormModel -> ( RegFormModel, Cmd Msg )
update message ({ form, errors, user } as model) = 
    case message of
        OnRegister (Ok user) ->
            ( model, Cmd.none )

        OnRegister (Err error) ->
            ( model, Cmd.none )

        FormMsg formMsg ->
            case ( formMsg, Form.getOutput form ) of
                ( Form.Submit, Just user ) ->
                    let newModel = { model | errors = [] }
                    in 
                        case (user.password == user.passwordConfirmation) of
                            True  -> ( newModel, register user )
                            False -> ( { newModel | errors = uniqErrors PasswordNotMatch errors }, Cmd.none )
                _ ->
                    ( { model | form = Form.update formMsg form }, Cmd.none )
