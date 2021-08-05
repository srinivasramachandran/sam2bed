# sam2bed
Converting sam to bed files with paired end data

To convert sam file to bedpe:

samtools sort -n <SAM_FILE> -o <BAM_FILE> 
samtools view -bf 0x2 <BAM_FILE> | bedtools bamtobed -i stdin -bedpe > <BEDPE_FILE>

perl bedpe2bed.pl <BEDPE_FILE> > <BED_FILE>

The BED_FILE from above will have the fragment start and end from paired end read pair. 
We limit fragment size to less than 700 to throw out unexpected fragments from MNase experiments.
