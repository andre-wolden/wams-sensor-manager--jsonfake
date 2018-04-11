module Views.Project.New exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (..)
import Db.DbModels exposing (Project)
import Db.DbModels exposing (..)
import Models exposing (..)
import RemoteData


viewNewProject : Model -> Html Msg
viewNewProject model =
    div []
        [ h3 [ class "row" ] [ text "New Project" ]
        , div [ class "form-group", id "NewProjectForm" ]
            [ input [ class "form-control", placeholder "name...", onInput OnInputNewProject_Name ] []
            , div []
                (case model.db.customers of
                    RemoteData.NotAsked ->
                        [ text "Initialising..." ]

                    RemoteData.Loading ->
                        [ text "Loading..." ]

                    RemoteData.Failure error ->
                        [ text ("Failed to retrieve data. Error message: " ++ (toString error)) ]

                    RemoteData.Success customers ->
                        List.map func customers
                )
            , button
                [ class "btn btn-primary"
                , onClick (SaveNewProject model.new_project)
                ]
                [ text "Add project" ]
            , text (toString model.new_project)
            ]
        ]


func : Customer -> Html Msg
func customer =
    fieldset []
        [ label []
            [ input [ type_ "radio" ] []
            , text customer.name
            ]
        ]



-- END
