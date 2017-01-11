module MainCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (input, label)
import Css.Namespace exposing (namespace)

type CssClasses
    = RegularLink
    | InputField
    | ErrorMessage
    | TitleNav

css : Stylesheet
css =
    (stylesheet << namespace "madison")
    [ input 
        [ fontSize (em 1.3) |> important ]
    , (.) RegularLink
        [ cursor pointer ]
    , (.) InputField
        [ children [ label [ fontSize (em 1.1) |> important ] ] ]
    , (.) ErrorMessage
        [ color (hex "F44336") ]
    , (.) TitleNav
        [ float left, paddingTop (px 10), paddingLeft (px 2) ]
    ]
