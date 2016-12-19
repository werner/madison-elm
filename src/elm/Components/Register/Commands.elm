module Components.Register.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Json.Encode as Encode
import Components.Register.Messages exposing (..)
import Components.Register.Models   exposing (..)

register : RegUser -> Cmd Msg
register user =
    Http.post registerUrl (Http.jsonBody (encodedRequest user)) userDecoder
        |> Http.send OnRegister

registerUrl : String
registerUrl = "http://localhost:9090/register"

userDecoder : Decode.Decoder RegUser
userDecoder = 
    Decode.map6 RegUser
        (field "reEmail"                Decode.string)
        (field "rePassword"             Decode.string)
        (field "rePasswordConfirmation" Decode.string)
        (field "reFirstName"            Decode.string)
        (field "reLastName"             Decode.string)
        (field "reCompanyName"          Decode.string)

encodedRequest : RegUser -> Encode.Value
encodedRequest user =
            Encode.object
                [ ( "reEmail",                Encode.string user.email )
                , ( "rePassword",             Encode.string user.password )
                , ( "rePasswordConfirmation", Encode.string user.passwordConfirmation )
                , ( "reFirstName",            Encode.string user.firstName )
                , ( "reLastName",             Encode.string user.lastName )
                , ( "reCompanyName",          Encode.string user.companyName )
                ]
