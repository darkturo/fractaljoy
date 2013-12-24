import os
import os.path
import argparse
import datetime

def main():
    description = """Lua formula skeleton generator."""
    parser = argparse.ArgumentParser(prog=os.path.basename(__file__), 
                                     description = description)
    parser.add_argument('-v', '--version', action = 'version', version = "%(prog)s 0.1.alfa")
    formulaTypes = ['base-motif', 'clusters', 'canopies', 'complex', 'IFS']
    parser.add_argument('-f', choices = formulaTypes, required = True, help='select the formula skeleton or template to be generated.')
    options = parser.parse_args()
    print genFormulaTemplate(options.f)

def genFormulaTemplate(formulaType):
    header = """
require "fractaljoy"
--[[
title: Descriptive title for this formula
author: {0:s}
date: {1:s}
description: Formula description
]]

function formulaType()
    return "{2:s}"
end

--[[ Customizable parameters hash map. ]]
formulaParameters = {{}}

function retrieveFormulaParameters()
    --[[ get Formula customizable parameters if any. ]]
    return formulaParameters
end 

function runFormula(params)
    --[[ Lua algorithm to generate the fractal. It will receive params with the
         options set by the user using the fractaljoy interface. 
         This function will use the primitives drawPoint(), drawLine or drawPoligon() and flush
         provided by fractaljoy.primitives
    ]]
    params = params or {{}}
end
    """.format(os.environ["USER"], datetime.date.today().strftime("%Y-%m-%d"), formulaType)    
    return header

if (__name__ == "__main__"):
    main()