module Components.Warehouses.Css exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)

type CssClasses
    = WarehouseIcon
    | WarehouseText
    | WarehouseSave

css : Stylesheet
css =
    (stylesheet << namespace "madison")
    [ (.) WarehouseIcon
        [ marginLeft (px -10) |> important ]
    , (.) WarehouseText
        [ paddingTop (px 3)
        , float left ]
    , (.) WarehouseSave
        [ top (px 25)
        , width (px 50) ]
    ]
