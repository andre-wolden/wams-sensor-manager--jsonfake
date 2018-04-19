module StatusCodes.StatusCodes exposing (..)


type alias StatusCode =
    { status : Code
    , status_description : String
    , next_todo : String
    }


type Code
    = Initiated
    | Registered
    | FactoryAcceptanceTested
    | Received
    | Installed
    | CalibrationTested
    | CalibrationCertificateOk
    | Delivered


initiated : StatusCode
initiated =
    { status = Initiated
    , status_description = "Initiated"
    , next_todo = "Register"
    }


registered : StatusCode
registered =
    { status = Registered
    , status_description = "Registered"
    , next_todo = "Supplier FAT"
    }


factoryAcceptanceTested : StatusCode
factoryAcceptanceTested =
    { status = FactoryAcceptanceTested
    , status_description = "FAT completed"
    , next_todo = "Receive to stock"
    }


received : StatusCode
received =
    { status = Received
    , status_description = "On stock"
    , next_todo = "Mount sensor"
    }


installed : StatusCode
installed =
    { status = Installed
    , status_description = "Sensor Mounted"
    , next_todo = "Perform calibration testing"
    }


calibrationTested : StatusCode
calibrationTested =
    { status = CalibrationTested
    , status_description = "Calibration testing completed"
    , next_todo = "Perform calibration analysis and create Calibration Certificate"
    }


calibrationCertificateOk : StatusCode
calibrationCertificateOk =
    { status = CalibrationCertificateOk
    , status_description = "Calibration Certificate Completed"
    , next_todo = "Deliver"
    }


delivered : StatusCode
delivered =
    { status = Delivered
    , status_description = "Delivered"
    , next_todo = "DONE!"
    }



-- END
