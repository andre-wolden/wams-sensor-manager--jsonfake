module Messages exposing (..)

import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Db.DbModels exposing (..)


type Msg
    = NoOp
      -- Routing Msgs
    | OnLocationChange Location
      -- HTTP Response Msgs
    | SensorsResponse (WebData Sensors)
    | PartNumbersResponse (WebData PartNumbers)
    | SensorTypesResponse (WebData SensorTypes)
    | ProjectsResponse (WebData Projects)
    | CustomersResponse (WebData Customers)
    | StatusCodesResponse (WebData StatusCodes)
    | MountingLocationsResponse (WebData MountingLocations)
    | OperatorsResponse (WebData Operators)
    | StatusLogResponse (WebData StatusLog)
