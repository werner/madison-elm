module Translations.Utils exposing (..)

type alias TranslationSet =
    { english : String
    , spanish : String }

type TranslationId
    = ErrInvalidEmail

type Language 
    = English
    | Spanish

translate : Language -> TranslationId -> String
translate lang trans =
  let
    translationSet =
      case trans of
        ErrInvalidEmail ->
          TranslationSet "Incorrect email format" "Formato de correo electrónico incorrecto"
  in
    case lang of
      English ->
        .english translationSet
      Spanish ->
        .spanish translationSet

