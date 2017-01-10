module Components.Warehouses.Css exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)

type CssClasses
    = WarehouseIcon
    | WarehouseText

css : Stylesheet
css =
    (stylesheet << namespace "madison")
    [ (.) WarehouseIcon
        [ fontSize (em 2) |> important
        , marginTop (px -7) ]
    , (.) WarehouseText
        [ paddingTop (px 3)
        , float left ]
    ]