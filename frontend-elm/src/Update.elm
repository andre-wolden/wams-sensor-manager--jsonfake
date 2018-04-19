module Update exposing (..)

import Models exposing (..)
import Messages exposing (Msg)
import Routing exposing (parseLocation)
import Commands
import Commands.PartNumberCommands
import Commands.ProjectCommands
import Commands.CustomerCommands
import Commands.OperatorCommands
import RemoteData


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
            let
                oldDb =
                    model.db

                newDb =
                    { oldDb | sensors = response }
            in
                ( { model | db = newDb }, Cmd.none )

        Messages.PartNumbersResponse response ->
            let
                oldDb =
                    model.db

                newDb =
                    { oldDb | part_numbers = response }
            in
                ( { model | db = newDb }, Cmd.none )

        Messages.SensorTypesResponse response ->
            let
                oldDb =
                    model.db

                newDb =
                    { oldDb | sensor_types = response }
            in
                ( { model | db = newDb }, Cmd.none )

        Messages.ProjectsResponse response ->
            let
                oldDb =
                    model.db

                newDb =
                    { oldDb | projects = response }
            in
                ( { model | db = newDb }, Cmd.none )

        Messages.CustomersResponse response ->
            let
                oldDb =
                    model.db

                newDb =
                    { oldDb | customers = response }
            in
                ( { model | db = newDb }, Cmd.none )

        Messages.StatusCodesResponse response ->
            let
                oldDb =
                    model.db

                newDb =
                    { oldDb | status_codes = response }
            in
                ( { model | db = newDb }, Cmd.none )

        Messages.MountingLocationsResponse response ->
            let
                oldDb =
                    model.db

                newDb =
                    { oldDb | mounting_locations = response }
            in
                ( { model | db = newDb }, Cmd.none )

        Messages.OperatorsResponse response ->
            let
                oldDb =
                    model.db

                newDb =
                    { oldDb | operators = response }
            in
                ( { model | db = newDb }, Cmd.none )

        Messages.StatusLogResponse response ->
            let
                oldDb =
                    model.db

                newDb =
                    { oldDb | status_log = response }
            in
                ( { model | db = newDb }, Cmd.none )

        -- PartNumber
        Messages.OnInputNewPartNumber_PartNumber string ->
            let
                part_number =
                    model.new_part_number

                updated_new_part_number =
                    { part_number | pn = string }
            in
                ( { model | new_part_number = updated_new_part_number }, Cmd.none )

        Messages.OnInputNewPartNumber_CalibrationProcedure string ->
            let
                part_number =
                    model.new_part_number

                updated_new_part_number =
                    { part_number | calibration_procedure = string }
            in
                ( { model | new_part_number = updated_new_part_number }, Cmd.none )

        Messages.SaveNewPartNumber new_partnumber ->
            ( { model
                | debugMessage = (new_partnumber.pn)
                , route = PartNumbersRoute
              }
            , Commands.PartNumberCommands.savePartNumber new_partnumber
            )

        Messages.OnPartNumberSaved (Ok response) ->
            ( { model
                | debugMessage = (toString response)
                , route = PartNumbersRoute
              }
            , Commands.fetchPartNumbersData
            )

        Messages.OnPartNumberSaved (Err error) ->
            ( { model | debugMessage = (toString error) }, Cmd.none )

        -- Project
        Messages.OnInputNewProject_Name updated_name ->
            let
                old =
                    model.new_project

                updated =
                    { old | name = updated_name }
            in
                ( { model | new_project = updated, debugMessage = updated_name }, Cmd.none )

        Messages.OnInputNewProject_CustomerId int ->
            let
                old =
                    model.new_project

                updated =
                    { old | customer = int }
            in
                ( { model | new_project = updated }, Cmd.none )

        Messages.SaveNewProject project ->
            ( { model | debugMessage = (project.name) }, Commands.ProjectCommands.saveProject project )

        Messages.OnProjectSaved (Ok response) ->
            ( { model | route = ProjectsRoute }, Commands.fetchProjectsData )

        Messages.OnProjectSaved (Err error) ->
            ( model, Cmd.none )

        -- Customer
        Messages.OnInputNewCustomer_Name updated_name ->
            let
                old =
                    model.new_customer

                updated =
                    { old | name = updated_name }
            in
                ( { model | new_customer = updated, debugMessage = updated_name }, Cmd.none )

        Messages.SaveNewCustomer customer ->
            ( { model
                | debugMessage = (customer.name)
                , route = CustomersRoute
              }
            , Commands.CustomerCommands.saveCustomer customer
            )

        Messages.OnCustomerSaved (Ok response) ->
            ( { model
                | debugMessage = (toString response)
                , route = CustomersRoute
              }
            , Commands.fetchCustomersData
            )

        Messages.OnCustomerSaved (Err error) ->
            ( { model | route = OopeSomethingWentWrongRoute }
            , Cmd.none
            )

        Messages.NewCustomerRegistered ->
            ( { model | route = CustomerNewRegisteredRoute }, Cmd.none )

        -- Operator
        Messages.OnInputNewOperator_Name updated_name ->
            let
                old =
                    model.new_operator

                updated =
                    { old | name = updated_name }
            in
                ( { model | new_operator = updated, debugMessage = updated_name }, Cmd.none )

        Messages.SaveNewOperator operator ->
            ( { model | debugMessage = (operator.name) }, Commands.OperatorCommands.saveOperator operator )

        Messages.OnOperatorSaved (Ok response) ->
            ( { model | route = OperatorsRoute }, Commands.fetchOperatorsData )

        Messages.OnOperatorSaved (Err error) ->
            ( model, Cmd.none )



-- END
