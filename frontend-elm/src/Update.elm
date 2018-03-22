module Update exposing (..)

import Models exposing (Model)
import Messages exposing (Msg)
import Routing exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Messages.NoOp ->
            ( model, Cmd.none )

        Messages.OnLocationChange location ->
            ( { model
                | route = parseLocation location
                , debugMessage = (toString (parseLocation location))
              }
            , Cmd.none
            )

        -- SensorDbresponses
        Messages.SensorsResponse response ->
            ( model, Cmd.none )

        Messages.PartNumbersResponse response ->
            ( model, Cmd.none )

        Messages.SensorTypesResponse response ->
            ( model, Cmd.none )

        Messages.ProjectsResponse response ->
            ( model, Cmd.none )

        Messages.CustomersResponse response ->
            ( model, Cmd.none )

        Messages.StatusCodesResponse response ->
            ( model, Cmd.none )

        Messages.MountingLocationsResponse response ->
            ( model, Cmd.none )

        Messages.OperatorsResponse response ->
            let
                oldDb =
                    model.db

                newDb =
                    { oldDb | operators = response }
            in
                ( { model | db = newDb }, Cmd.none )

        Messages.StatusLogResponse response ->
            ( model, Cmd.none )
