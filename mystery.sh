#!/bin/bash

# make the output folder
mkdir -p working_dir

# loop over each outlet folder
for outlet_dir in sequences_by_outlet/outlet_*; do

  # get the outlet name, eg. outlet_02
  outlet=$(basename "$outlet_dir")

  # loop over each fasta file in that outlet
  for file in "$outlet_dir"/*.fasta; do

    # get the file name, eg. seq072.fasta
    name=$(basename "$file")

    # add the outlet name to the header
    # save the new file in working_dir
    sed "s/^>/>${outlet}_/" $file > "working_dir/${outlet}_${name}"

  done
done

echo "Done"
