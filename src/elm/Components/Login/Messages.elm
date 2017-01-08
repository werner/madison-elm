module Components.Login.Messages exposing (..)

import Http
import Components.Login.Models exposing (..)

type Msg = GoToLogin String String String
         | OnLogIn String (Result Http.Error CurrentUser) 
         | GoToRegister
         | Email String
         | Password String
