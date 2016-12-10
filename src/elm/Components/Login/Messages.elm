module Components.Login.Messages exposing (..)

type Msg = GoToLogin String String
         | Email String
         | Password String
         | PasswordConfirmation String
