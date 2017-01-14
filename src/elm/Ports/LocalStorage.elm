port module Ports.LocalStorage exposing (..)

import Json.Encode as Encode

port saveStorage   : (Encode.Value, Bool) -> Cmd msg
port loadStorage   : (String -> msg) -> Sub msg
port doloadStorage : String -> Cmd msg
