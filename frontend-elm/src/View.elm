module View exposing (..)

import Models exposing (Model)
import Html exposing (..)
import Messages exposing (Msg)
import ResourceViews.OperatorsView as OperatorsView


view : Model -> Html Msg
view model =
    div []
        [ text "sensor-app"
        , text model.debugMessage
        ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.Home ->
            text "Home"

        Models.OperatorsRoute ->
            text "Operators Route"

        Models.OperatorRoute idString ->
            OperatorsView.viewOperatorById model.db.operators idString

        Models.OperatorNewRoute ->
            text "New Operator Route"

        Models.NotFoundRoute ->
            text "Not Found Route"
