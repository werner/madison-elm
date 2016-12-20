port module StyleSheets exposing (..)

import Css.File exposing (..)

import Components.Login.Css as Login

port files : CssFileStructure -> Cmd msg

fileStructure : CssFileStructure
fileStructure =
  toFileStructure [ ( "login.css", compile [ Login.css ] ) ]

main : CssCompilerProgram
main =
  compiler files fileStructure
