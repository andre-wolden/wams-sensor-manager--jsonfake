module View exposing (..)

import Models exposing (Model)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Views.Sensor.All
import Views.PartNumber.All
import Views.PartNumber.New
import Views.Project.ById
import Views.Project.All
import Views.Project.New
import Views.Customer.ById
import Views.Customer.All
import Views.Customer.New
import Views.Customer.Registered
import Views.Operator.ById exposing (..)
import Views.Operator.All exposing (..)
import Views.Operator.New exposing (..)
import Views.Common.Oops exposing (..)
import Routing


view : Model -> Html Msg
view model =
    div []
        [ nav [ class "navbar navbar-expand-lg navbar-light bg-dark text-light" ]
            [ div [ id "icon-container" ] [ a [ class "navbar-brand" ] [ img [ src "assets/immortal.png" ] [] ] ]
            , a [ class "nav-link text-light", href Routing.getIndexPath ] [ text "ALL" ]
            , button
                [ class "navbar-toggler"
                , attribute "data-toggle" "collapse"
                , attribute "data-target" "#navbarSupportedContent"
                , attribute "aria-controls" "navbarSupportedContent"
                , attribute "aria-expanded" "false"
                , attribute "aria-label" "Toggle navigation"
                ]
                [ span [ class "navbar-toggler-icon" ] []
                ]
            , div [ class "collapse navbar-collapse", id "navbarSupportedContent" ]
                [ ul [ class "navbar-nav mr-auto woldenNavbarLeft" ]
                    [ li [ class "nav-item active" ]
                        [ a [ class "nav-link text-light", href Routing.getProjectsPath ] [ text "Projects" ] ]
                    , li [ class "nav-item active" ]
                        [ a [ class "nav-link text-light", href Routing.getCustomersPath ] [ text "Customers" ] ]
                    , li [ class "nav-item active" ]
                        [ a [ class "nav-link text-light", href Routing.getPartNumberPath ] [ text "PNs" ] ]
                    , li [ class "nav-item active" ]
                        [ a [ class "nav-link text-light", href Routing.getOperatorsPath ] [ text "Operators" ] ]
                    , li [ class "nav-item active" ]
                        [ a [ class "nav-link text-light", href Routing.getIndexPath ] [ text "Types" ] ]
                    , li [ class "nav-item active" ]
                        [ a [ class "nav-link text-light", href Routing.getIndexPath ] [ text "Codes" ] ]
                    , li [ class "nav-item active" ]
                        [ a [ class "nav-link text-light", href Routing.getIndexPath ] [ text "Mounting" ] ]
                    , li [ class "nav-item active" ]
                        [ a [ class "nav-link text-light", href Routing.getIndexPath ] [ text "Log" ] ]
                    ]
                ]
            ]
        , div [ id "page" ]
            [ page model
            ]

        -- , div [ class "push-to-bottom jumbotron" ]
        --     [ p [] [ text (toString model.db) ]
        --     , p [] [ text model.debugMessage ]
        --     ]
        ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.Home ->
            div []
                [ ul [ class "list-group list-group-flush" ]
                    [ li [ class "list-group-item" ]
                        [ a [ class "text-dark", href Routing.getCustomersPath ]
                            [ text "Customers" ]
                        ]
                    , li [ class "list-group-item" ]
                        [ a [ class "text-dark", href Routing.getProjectsPath ]
                            [ text "Projects" ]
                        ]
                    , li [ class "list-group-item" ]
                        [ a [ class "text-dark", href Routing.getOperatorsPath ]
                            [ text "Operators" ]
                        ]
                    ]
                , p [] []
                , Views.Sensor.All.insertSensorTable model
                ]

        Models.Index ->
            div [ class "col-10" ]
                [ ul [ class "list-group list-group-flush" ]
                    [ li [ class "list-group-item" ]
                        [ a [ class "text-dark", href Routing.getCustomersPath ]
                            [ text "Customers" ]
                        ]
                    , li [ class "list-group-item" ]
                        [ a [ class "text-dark", href Routing.getProjectsPath ]
                            [ text "Projects" ]
                        ]
                    , li [ class "list-group-item" ]
                        [ a [ class "text-dark", href Routing.getOperatorsPath ]
                            [ text "Operators" ]
                        ]
                    ]
                , p [] []
                , Views.Sensor.All.insertSensorTable model
                ]

        -- PartNumbers
        Models.PartNumbersRoute ->
            Views.PartNumber.All.viewAllPartNumbers model.db.part_numbers

        Models.PartNumbersNewRoute ->
            Views.PartNumber.New.viewNewPartNumber model

        -- Project
        Models.ProjectsRoute ->
            Views.Project.All.viewAllProjects model.db.projects model.db.customers

        Models.ProjectRoute idString ->
            Views.Project.ById.viewProjectById model.db.projects idString

        Models.ProjectNewRoute ->
            Views.Project.New.viewNewProject model

        -- Customer
        Models.CustomersRoute ->
            Views.Customer.All.viewAllCustomers model.db.customers

        Models.CustomerRoute idString ->
            Views.Customer.ById.viewCustomerById model.db.customers idString

        Models.CustomerNewRoute ->
            Views.Customer.New.viewNewCustomer model

        Models.CustomerNewRegisteredRoute ->
            Views.Customer.Registered.viewRegistered model

        -- Operator
        Models.OperatorsRoute ->
            Views.Operator.All.viewAllOperators model.db.operators

        Models.OperatorRoute idString ->
            Views.Operator.ById.viewOperatorById model.db.operators idString

        Models.OperatorNewRoute ->
            Views.Operator.New.viewNewOperator model

        Models.NotFoundRoute ->
            text "Not Found Route"

        Models.OopeSomethingWentWrongRoute ->
            Views.Common.Oops.viewOops



-- END
