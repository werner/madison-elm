port module Ports.InfiniteScroll exposing (..)

port loadScrollAction : ((String, Int) -> msg) -> Sub msg
port initializeOffset : () -> Cmd msg
