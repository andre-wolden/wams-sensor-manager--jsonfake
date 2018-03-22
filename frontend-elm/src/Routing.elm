module Routing exposing (..)

import Navigation exposing (..)
import UrlParser exposing (..)
import Models exposing (Route(..))


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map Home top
        , map OperatorsRoute (s "operators")
        , map OperatorRoute (s "operator" </> string)
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
