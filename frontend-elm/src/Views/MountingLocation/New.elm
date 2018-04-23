module Views.MountingLocation.New exposing (..)

import Db.DbModels exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import RemoteData exposing (WebData)
import CommonComponents.ErrorSymbol
import CommonComponents.Spinner
import Routing


viewMountingLocationNewForm : Html Msg
viewMountingLocationNewForm =
    div []
        [ h3 [] [ text "Register new mounting location option" ]
        , div [ class "form-group" ]
            [ label [] [ text "description" ]
            , input [ class "form-control" ] []
            ]
        ]
