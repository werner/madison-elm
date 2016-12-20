module Components.Login.Css exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)

type CssClasses
    = LoginIcon

css : Stylesheet
css =
    (stylesheet << namespace "login")
    [ (.) LoginIcon
        [ fontSize (em 2) |> important ]
    ]
