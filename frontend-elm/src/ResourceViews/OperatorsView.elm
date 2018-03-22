module ResourceViews.OperatorsView exposing (..)

import Db.DbModels exposing (..)
import Html exposing (..)
import Messages exposing (..)
import RemoteData exposing (WebData)


viewOperators : WebData Operators -> Html Msg
viewOperators operators =
    case operators of
        RemoteData.NotAsked ->
            text "Initialising operator data"

        RemoteData.Loading ->
            text "Loading operator data"

        RemoteData.Failure error ->
            text ("Failed to retrieve operator data. Error message: " ++ (toString error))

        RemoteData.Success operators ->
            div [] (List.map viewOperator operators)


viewOperatorById : WebData Operators -> String -> Html Msg
viewOperatorById operators operatorIdString =
    case operators of
        RemoteData.NotAsked ->
            text "Initialising"

        RemoteData.Loading ->
            text "Loading"

        RemoteData.Failure error ->
            text ("Error: " ++ toString error)

        RemoteData.Success operators ->
            let
                operatorId =
                    String.toInt operatorIdString
            in
                case operatorId of
                    Ok id ->
                        let
                            maybeOperator =
                                operators
                                    |> List.filter (\operator -> operator.id == id)
                                    |> List.head
                        in
                            case maybeOperator of
                                Just operator ->
                                    viewOperator operator

                                Nothing ->
                                    text "No operator with this ID number"

                    Err error ->
                        text "error"


viewOperator : Operator -> Html Msg
viewOperator operator =
    div []
        [ text ("Operator name: " ++ operator.name)
        ]
