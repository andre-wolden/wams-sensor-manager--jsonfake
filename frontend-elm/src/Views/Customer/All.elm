module Views.Customer.All exposing (..)

import Db.DbModels exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import RemoteData exposing (WebData)
import Views.Customer.Common exposing (..)
import Routing


viewAllCustomers : WebData Customers -> Html Msg
viewAllCustomers customers =
    case customers of
        RemoteData.NotAsked ->
            text "Initialising..."

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Failure error ->
            text ("Failed to retrieve data. Error message: " ++ (toString error))

        RemoteData.Success customers ->
            insertContent customers


insertContent : Customers -> Html Msg
insertContent customers =
    div []
        [ div [] (List.map viewCustomer customers)
        , a [ class "btn btn-success", href Routing.getCustomerNewPath ]
            [ text "Register new customer" ]
        ]
