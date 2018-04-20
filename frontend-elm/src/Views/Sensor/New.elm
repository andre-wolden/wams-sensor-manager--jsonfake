module Views.Sensor.New exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model)
import Messages exposing (Msg)
import Routing


viewNewSensorPage : Model -> Html Msg
viewNewSensorPage model =
    div [ class "container" ]
        [ h3 [ class "row" ] [ text "New Sensor" ]
        , div [ class "form-group", id "NewSensorForm" ]
            [ label [] [ text "Serial number:" ]
            , input [ class "form-control", placeholder "serial number..." ] []
            , label [] [ text "asdf" ]
            , input [ class "form-control", placeholder "asdf ..." ] []
            , label [] [ text "asdf" ]
            , input [ class "form-control", placeholder "asdf ..." ] []
            , label [] [ text "asdf" ]
            , input [ class "form-control", placeholder "asdf ..." ] []
            , label [] [ text "asdf" ]
            , input [ class "form-control", placeholder "asdf ..." ] []
            , p [] []
            , a [ class "btn btn-danger", href Routing.getIndexPath ] [ text "back" ]
            , button
                [ class "btn btn-primary"

                --, onClick (SaveNewPartNumber model.new_part_number)
                ]
                [ text "Add partNumber" ]
            , text (toString model.new_part_number)
            ]
        ]
