port module Stylesheets exposing (..)

import Css.File exposing (..)

import MainCss exposing (..)

import Components.Login.Css as Login
import Components.Warehouses.Css as Warehouses

port files : CssFileStructure -> Cmd msg

fileStructure : CssFileStructure
fileStructure =
  toFileStructure [ ( "styles.css", compile [ Login.css, MainCss.css, Warehouses.css ] ) ]

main : CssCompilerProgram
main =
  compiler files fileStructure
