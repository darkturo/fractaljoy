#include "FractaljoyLogger.h"

BOOST_LOG_GLOBAL_LOGGER_INIT(FractalJoyLogger, src::severity_logger)
{
    src::severity_logger<severity_level> lg;
//    lg.add_attribute("StopWatch", boost::make_shared< attrs::timer >());
    return lg;
}