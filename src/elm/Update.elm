module Update exposing (..)

import Routing  exposing (parseLocation)
import Navigation
import Json.Decode exposing (..)
import Messages exposing (Msg(..))
import Models   exposing (Model)
import Ports.LocalStorage exposing (..)
import Components.Warehouses.Update
import Components.Login.Update
import Components.Register.Update

import Components.Login.Models exposing (User, CurrentUser) 

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        LoginMsg subMsg ->
            let
                ( updateLogin, cmd ) =
                    Components.Login.Update.update subMsg model
            in
                ( { model | user = updateLogin.user, isLocalStorage = updateLogin.isLocalStorage }, Cmd.map LoginMsg cmd )

        RegisterMsg subMsg ->
            let
                ( updateRegister, cmd ) =
                    Components.Register.Update.update subMsg model.regUser
            in
                ( { model | regUser = updateRegister }, Cmd.map RegisterMsg cmd )

        WarehousesMsg subMsg ->
            let
                ( updateWarehouses, cmd ) =
                    Components.Warehouses.Update.update model.currentUser.id subMsg model.warehouseModel
            in
                ( { model | warehouseModel = updateWarehouses }, Cmd.map WarehousesMsg cmd )

        OnLocationChange location ->
            let
                newRoute = parseLocation location
            in
                ( { model | route = newRoute }, doloadStorage "currentUser" )

        LoadLocalStorage object ->
            case model.route of
                Routing.RegisterRoute -> ( model, Cmd.none )
                Routing.LoginRoute    -> ( model, Cmd.none )
                _                     ->
                    case (decodeString getCurrentUser object) of
                        Ok  obj -> ( { model | currentUser = CurrentUser obj.id obj.email }, Cmd.none )
                        Err err -> ( { model | currentUser = CurrentUser "" "" },  Navigation.newUrl "#login" )

getCurrentUser : Decoder CurrentUser
getCurrentUser = 
    map2 CurrentUser
      (at ["currentUser", "id"] string)
      (at ["currentUser", "email"] string)
