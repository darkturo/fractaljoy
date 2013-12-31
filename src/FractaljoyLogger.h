#ifndef __FractaljoyLogger_h__
#define __FractaljoyLogger_h__
#include <log/sources/global_logger_storage.hpp>
#include <log/sources/severity_logger.hpp>

enum severity_level
{
    normal,
    warning,
    error
};

BOOST_LOG_GLOBAL_LOGGER(FractaljoyLogger, src::severity_logger)

FRACTALJOY_LOGGER(severity, ...)    BOOST_LOG_SEV(FractaljoyLogger::get(), severity) << __VA_ARGS__

#endif