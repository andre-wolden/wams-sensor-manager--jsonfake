module Models exposing (..)

import Db.DbModels exposing (..)
import RemoteData exposing (WebData)


type alias Model =
    { debugMessage : String
    , route : Route
    , db : SensorDb
    }


initialModel : Route -> Model
initialModel route =
    { debugMessage = "Initial tullball"
    , route = route
    , db = initialDb
    }


initialDb : SensorDb
initialDb =
    { sensors = RemoteData.Loading
    , part_numbers = RemoteData.Loading
    , sensor_types = RemoteData.Loading
    , projects = RemoteData.Loading
    , customers = RemoteData.Loading
    , status_codes = RemoteData.Loading
    , mounting_locations = RemoteData.Loading
    , operators = RemoteData.Loading
    , status_log = RemoteData.Loading
    }


type Route
    = Home
    | OperatorsRoute
    | OperatorRoute String
    | OperatorNewRoute
    | NotFoundRoute



-- End
