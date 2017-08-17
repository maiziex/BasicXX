import sys
import os

from argparse import ArgumentParser

parser = ArgumentParser(description="Run 10x Basic -- step 6: concatenate all h5 files ")
parser.add_argument('--h5_dir','-h5', help="Directory to store h5 related files", default='../temp_h5/')

args = parser.parse_args()

if __name__ == "__main__":
    if len(sys.argv) == 1:
        os.system("python BasicXX_step6.py -h")
    else:
        if not os.path.exists(args.h5_dir):
            os.system("mkdir " + args.h5_dir)
        
        command_1 = "./cat_h5.sh "  + " " + args.h5_dir 
        os.system(command_1)

        






