import os.path
import argparse


if (__name__ == "__main__"):
    description = """Lua formula skeleton generator."""
    parser = argparse.ArgumentParser(prog=os.path.basename(__file__), 
                                     description = description)
    parser.add_argument('-v', '--version', action = 'version', version = "%(prog)s 0.1.alfa")
    parser.add_argument('-f', choices = ['base-motif', 'clusters', 'canopies', 'complex', 'IFS'], required = True, help='select the formula skeleton or template to be generated.')
    options = parser.parse_args()
