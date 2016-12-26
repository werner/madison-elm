module Translations.Utils exposing (..)

type alias TranslationSet =
    { english : String
    , spanish : String }

type TranslationId
    = ErrInvalidEmail
    | PasswordNotMatch
    | ErrEmpty

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

        PasswordNotMatch ->
          TranslationSet "Password and confirmation don't match" "La contraseña y su confirmación no coinciden"

        ErrEmpty ->
          TranslationSet "Can't be blank" "No puede quedar en blanco"
  in
    case lang of
      English ->
        .english translationSet
      Spanish ->
        .spanish translationSet

