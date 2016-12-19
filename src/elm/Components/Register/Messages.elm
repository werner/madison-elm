module Components.Register.Messages exposing (..)

import Http
import Components.Register.Models exposing ( RegUser )

type Msg = GoToRegister RegUser
         | OnRegister (Result Http.Error RegUser)
         | Email    String
         | Password String
         | PasswordConfirmation String
         | FirstName   String
         | LastName    String
         | CompanyName String

