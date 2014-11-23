#include <iostream>
#include <program_options.hpp>
#include "FractaljoyLogger.h"

int main(int argc, char ** argv)
{
    if ( ! parseArguments(argc, argv) ) 
    {
        return 1;
    }

    return 0;
}

boost::program_options::parsed_options parseArguments(int argc, char ** argv) 
{
    options_description desc;
    desc.add_options()
        ("help,h", "print help message")
        ("verbose,v", value<bool>()->zero_tokens()->default_value(false)->implicit_value(true), "verbosity level")
        ("formula"), po::value<std::vector<std::string> >(), "Lua formula file.") 
    ;

    positional_options_description posdesc;
    posdesc.add("formula", -1)

    boost::program_options::parsed_options parsed = boost::program_options::command_line_parser(argc, argv).
                                                                         options(desc).positional(pd).run(); 

    return parsed;
}

options_description & setCommandLineOptions()
{




}