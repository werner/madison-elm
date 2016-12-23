module Components.Register.Messages exposing (..)

import Http
import Form exposing (Form)
import Components.Register.Models exposing (RegUser)

type Msg = OnRegister (Result Http.Error RegUser)
         | FormMsg Form.Msg
