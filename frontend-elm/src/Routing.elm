module Routing exposing (..)

import Navigation exposing (..)
import UrlParser exposing (..)
import Models exposing (Route(..))


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map Home top
        , map PartNumbersRoute (s "partnumbers")
        , map PartNumbersNewRoute (s "partnumbers" </> s "new")
        , map ProjectsRoute (s "projects")
        , map ProjectRoute (s "project" </> string)
        , map ProjectNewRoute (s "projects" </> s "new")
        , map CustomersRoute (s "customers")
        , map CustomerRoute (s "customer" </> string)
        , map CustomerNewRoute (s "customers" </> s "new")
        , map CustomerNewRegisteredRoute (s "customers" </> s "registered")
        , map OperatorsRoute (s "operators")
        , map OperatorRoute (s "operator" </> string)
        , map OperatorNewRoute (s "operators" </> s "new")
        , map Index (s "index")
        , map OopeSomethingWentWrongRoute (s "oops")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


getIndexPath : String
getIndexPath =
    "#index"


getSensorsPath : String
getSensorsPath =
    "#sensors"


getProjectsPath : String
getProjectsPath =
    "#projects"


getProjectNewRoute : String
getProjectNewRoute =
    "#projects/new"


getCustomersPath : String
getCustomersPath =
    "#customers"


getCustomerNewPath : String
getCustomerNewPath =
    "#customers/new"


getOperatorsPath : String
getOperatorsPath =
    "#operators"


getPartNumberPath : String
getPartNumberPath =
    "#partnumbers"


getPartNumberNewPath : String
getPartNumberNewPath =
    "#partnumbers/new"


getOperatorNewPath : String
getOperatorNewPath =
    "#operators/new"
