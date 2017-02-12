module Translations.Utils exposing (..)

import List exposing (member)

type alias TranslationSet =
    { english : String
    , spanish : String }

type TranslationId
    = ErrInvalidEmail
    | PasswordNotMatch
    | ErrEmpty
    | ErrInvalidString
    | HttpError String

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

        ErrInvalidString ->
          TranslationSet "Invalid String" "Cadena de texto inválida"

        HttpError err ->
          TranslationSet err err
  in
    case lang of
      English ->
        .english translationSet
      Spanish ->
        .spanish translationSet

uniqErrors : TranslationId -> List TranslationId -> List TranslationId
uniqErrors error errors = 
    case (member error errors) of
        True  -> errors
        False -> error :: errors
