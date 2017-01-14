module Components.Login.Messages exposing (..)

import Http
import Components.Login.Models exposing (..)

type Msg = GoToLogin
         | OnLogIn (Result Http.Error CurrentUser) 
         | GoToRegister
         | Email String
         | Password String
         | KeyDown Int
