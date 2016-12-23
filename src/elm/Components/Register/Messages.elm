module Components.Register.Messages exposing (..)

import Http
import Form exposing (Form)
import Components.Register.Models exposing (RegUser)

type Msg = GoToRegister RegUser
         | OnRegister (Result Http.Error RegUser)
         | FormMsg Form.Msg
