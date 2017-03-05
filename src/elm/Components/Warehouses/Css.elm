module Components.Warehouses.Css exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)

type CssClasses
    = WarehouseIcon
    | WarehouseName
    | WarehouseText
    | WarehouseSave

css : Stylesheet
css =
    (stylesheet << namespace "madison")
    [ (.) WarehouseIcon
        [ position absolute
        , overflow hidden
        , left (px 15)
        , display inlineBlock
        , verticalAlign middle ]
    , (.) WarehouseText
        [ paddingTop (px 3)
        , float left ]
    , (.) WarehouseName
        [ display inlineBlock 
        , left (px 35)
        , position relative ]
    , (.) WarehouseSave
        [ top (px 25)
        , width (px 50) ]
    ]
