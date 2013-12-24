import os.path
import argparse


def main():
    description = """Lua formula skeleton generator."""
    parser = argparse.ArgumentParser(prog=os.path.basename(__file__), 
                                     description = description)
    parser.add_argument('-v', '--version', action = 'version', version = "%(prog)s 0.1.alfa")
    parser.add_argument('-f', choices = genFormulaSkel.keys(), required = True, help='select the formula skeleton or template to be generated.')
    options = parser.parse_args()
    genFormulaSkel[options.f]()

def genBaseMotifFormula():
    pass

def genClusterFormula():
    pass

def genCanopiesFormula():
    pass

def genComplexFormula():
    pass

def genIFSFormula():
    pass

# fractaljoy formula types:
genFormulaSkel = {
    'base-motif':  genBaseMotifFormula,
    'clusters': genClusterFormula,
    'canopies': genCanopiesFormula,
    'complex': genComplexFormula,
    'IFS': genIFSFormula
}

if (__name__ == "__main__"):
    main()