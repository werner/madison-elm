module Components.Login.Messages exposing (..)

import Material

type Msg = GoToLogin String String
         | Email String
         | Password String
         | PasswordConfirmation String
         | Mdl (Material.Msg Msg)
