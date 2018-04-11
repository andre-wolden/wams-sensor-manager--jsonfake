module Views.Operator.All exposing (..)

import Db.DbModels exposing (..)
import Html exposing (..)
import Messages exposing (..)
import RemoteData exposing (WebData)
import Views.Operator.Common exposing (..)
import Html.Attributes exposing (..)
import CommonComponents.Spinner as Spinner


viewAllOperators : WebData Operators -> Html Msg
viewAllOperators operators =
    case operators of
        RemoteData.NotAsked ->
            Spinner.insertSpinner

        RemoteData.Loading ->
            text "Loading operator data"

        RemoteData.Failure error ->
            text ("Failed to retrieve operator data. Error message: " ++ (toString error))

        RemoteData.Success operators ->
            div [] (List.map viewOperator operators)
