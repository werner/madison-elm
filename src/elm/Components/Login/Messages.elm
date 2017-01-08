module Components.Login.Messages exposing (..)

import Http
import Components.Login.Models exposing ( LoginModel, User )

type Msg = GoToLogin String String String
         | OnLogIn String (Result Http.Error User) 
         | GoToRegister
         | Email String
         | Password String
