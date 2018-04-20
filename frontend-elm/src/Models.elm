module Models exposing (..)

import Db.DbModels exposing (..)
import RemoteData exposing (WebData)


type alias Model =
    { debugMessage : String
    , route : Route

    -- All SensorDb data
    , db : SensorDb
    , dbLoaded : SensorDbLoaded
    , allDataLoaded : Bool

    -- Records to capture onInput
    -- , new_sensor : Sensor
    -- , new_part_number : PartNumber
    -- , new_sensor_type : SensorType
    , new_part_number : PartNumber
    , new_project : Project
    , new_customer : Customer

    -- , new_status_code : StatusCode
    -- , new_mounting_location : MountingLocation
    , new_operator : Operator

    -- , newStatus_log_item : StatusLog
    -- Div
    , nameFieldEmpty : String

    -- ExpandableRows in the SuperTable
    , rowIsExpanded : Bool
    , expandedRow : Int
    }


initialModel : Route -> Model
initialModel route =
    { debugMessage = "Initial tullball"
    , route = route
    , db = initialDb
    , dbLoaded = initialDbLoaded
    , allDataLoaded = False

    -- Records to capture onInput
    -- , new_sensor = Sensor
    -- , new_part_number = PartNumber
    -- , new_sensor_type = SensorType
    , new_part_number = { id = 0, pn = "", calibration_procedure = "" }
    , new_project = { id = 0, name = "", customer = 0 }
    , new_customer = { id = 0, name = "" }

    -- , new_status_code = StatusCode
    -- , new_mounting_location = MountingLocation
    , new_operator = { id = 0, name = "" }

    -- , new_status_log_item = StatusLogItem
    -- Div
    , nameFieldEmpty = ""
    , rowIsExpanded = False
    , expandedRow = 0
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


initialDbLoaded : SensorDbLoaded
initialDbLoaded =
    { sensors = []
    , part_numbers = []
    , sensor_types = []
    , projects = []
    , customers = []
    , status_codes = []
    , mounting_locations = []
    , operators = []
    , status_log = []
    }


type Route
    = Home
    | SensorsNewRoute
    | PartNumbersRoute
    | PartNumbersNewRoute
    | ProjectsRoute
    | ProjectRoute String
    | ProjectNewRoute
    | CustomersRoute
    | CustomerRoute String
    | CustomerNewRoute
    | CustomerNewRegisteredRoute
    | OperatorsRoute
    | OperatorRoute String
    | OperatorNewRoute
    | NotFoundRoute
    | Index
    | OopeSomethingWentWrongRoute



-- End
