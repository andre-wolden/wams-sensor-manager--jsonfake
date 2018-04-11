module Messages exposing (..)

import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Db.DbModels exposing (..)
import Http exposing (Error)


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
      -- Saving New Project
    | OnInputNewProject_Name String
    | SaveNewProject Project
    | OnProjectSaved (Result Http.Error Project)
      -- Saving New Customer
    | OnInputNewCustomer_Name String
    | SaveNewCustomer Operator
    | OnCustomerSaved (Result Http.Error Customer)
    | NewCustomerRegistered
      -- Saving New Operator
    | OnInputNewOperator_Name String
    | SaveNewOperator Operator
    | OnOperatorSaved (Result Http.Error Operator)
