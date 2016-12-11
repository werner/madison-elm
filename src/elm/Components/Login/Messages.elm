module Components.Login.Messages exposing (..)

import Http
import Components.Login.Models exposing ( User )

type Msg = GoToLogin String String
         | OnLogIn (Result Http.Error User)
         | Email String
         | Password String
