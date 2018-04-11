module Views.Sensor.All exposing (..)

import Messages exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (..)
import CommonComponents.Spinner
import RemoteData
import Db.DbModels exposing (..)


insertSensorTable : Model -> Html Msg
insertSensorTable model =
    let
        sensors =
            model.db.sensors

        partNumbers =
            model.db.part_numbers

        types =
            model.db.sensor_types

        projects =
            model.db.projects

        statuses =
            model.db.status_codes
    in
        case sensors of
            RemoteData.NotAsked ->
                div [] [ CommonComponents.Spinner.insertSpinner ]

            RemoteData.Loading ->
                div [] [ CommonComponents.Spinner.insertSpinner ]

            RemoteData.Failure error ->
                div [] [ CommonComponents.Spinner.insertSpinner ]

            RemoteData.Success sensors ->
                case partNumbers of
                    RemoteData.NotAsked ->
                        div [] [ CommonComponents.Spinner.insertSpinner ]

                    RemoteData.Loading ->
                        div [] [ CommonComponents.Spinner.insertSpinner ]

                    RemoteData.Failure error ->
                        div [] [ CommonComponents.Spinner.insertSpinner ]

                    RemoteData.Success partNumbers ->
                        case types of
                            RemoteData.NotAsked ->
                                div [] [ CommonComponents.Spinner.insertSpinner ]

                            RemoteData.Loading ->
                                div [] [ CommonComponents.Spinner.insertSpinner ]

                            RemoteData.Failure error ->
                                div [] [ CommonComponents.Spinner.insertSpinner ]

                            RemoteData.Success types ->
                                case projects of
                                    RemoteData.NotAsked ->
                                        div [] [ CommonComponents.Spinner.insertSpinner ]

                                    RemoteData.Loading ->
                                        div [] [ CommonComponents.Spinner.insertSpinner ]

                                    RemoteData.Failure error ->
                                        div [] [ CommonComponents.Spinner.insertSpinner ]

                                    RemoteData.Success projects ->
                                        case statuses of
                                            RemoteData.NotAsked ->
                                                div [] [ CommonComponents.Spinner.insertSpinner ]

                                            RemoteData.Loading ->
                                                div [] [ CommonComponents.Spinner.insertSpinner ]

                                            RemoteData.Failure error ->
                                                div []
                                                    [ CommonComponents.Spinner.insertSpinner ]

                                            RemoteData.Success statuses ->
                                                createTable
                                                    sensors
                                                    partNumbers
                                                    types
                                                    projects
                                                    statuses


createTable : Sensors -> PartNumbers -> SensorTypes -> Projects -> StatusCodes -> Html Msg
createTable sensors partNumbers types projects statuses =
    table [ class "table" ]
        [ thead []
            [ tr [ class "row" ]
                [ th [ class "col" ] [ text "SN" ]
                , th [ class "col" ] [ text "PN" ]
                , th [ class "col" ] [ text "Type" ]
                , th [ class "col" ] [ text "Certificate" ]
                , th [ class "col" ] [ text "Project" ]
                , th [ class "col" ] [ text "Status" ]
                ]
            ]
        , tbody []
            (List.map
                (\sensor ->
                    tr [ class "row" ]
                        [ td [ class "col" ] [ text sensor.sn ]
                        , td [ class "col" ]
                            (List.map
                                (\pn ->
                                    if pn.id == sensor.pn then
                                        text pn.pn
                                    else
                                        text ""
                                )
                                partNumbers
                            )
                        , td [ class "col" ]
                            (List.map
                                (\typee ->
                                    if typee.id == sensor.sensor_type then
                                        text typee.sensor_type
                                    else
                                        text ""
                                )
                                types
                            )
                        , td [] [ text sensor.calibration_certificate ]
                        , td [ class "col" ]
                            (List.map
                                (\project ->
                                    if project.id == sensor.project then
                                        text project.name
                                    else
                                        text ""
                                )
                                projects
                            )
                        , td [ class "col" ]
                            (List.map
                                (\status ->
                                    if status.id == sensor.current_status then
                                        text status.current_status
                                    else
                                        text ""
                                )
                                statuses
                            )
                        ]
                )
                sensors
            )
        ]



-- End
