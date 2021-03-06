import sys
import os

from argparse import ArgumentParser
from argparse import RawDescriptionHelpFormatter 

parser = ArgumentParser(description= '''Run 10x Basic -- step 2: Generate Barcoded Fastqs Files  
        --------------------  will call run_list_generate_barcoded_fastq.sh and generate_barcoded_fastq_for_bwa_2.py''')
parser.add_argument('--output_file_prefix','-o', help="Output file prefix")
parser.add_argument('--out_dir','-o_dir', help="Directory to store outputs", default='../temp/')

args = parser.parse_args()

if __name__ == "__main__":
    if len(sys.argv) == 1:
        os.system("python BasicXX_step2.py -h")
    else:
        output = open('count_files.txt','r').read()
        num_files = int(output) - 1
        
        command_5 = "./run_list_generate_barcoded_fastq.sh "  + args.out_dir + args.output_file_prefix + " " + str(num_files-1)
        os.system(command_5)

        






