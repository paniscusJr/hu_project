# Healthcare utilization checklist

CNV_DIR=/home/mtoetjens/nas/MyCode_t1/DiscovEHR/RGC/GHS_Freeze_145_v3_pVCF/data/CNVs

# Total number that underwent exome sequencing
#135883 

# Total number of samples that underwent CNV calling.
find ${CNV_DIR} -name "*samples.txt"| grep -v callset  | xargs cat | grep -v AtlantiCare | wc -l
#135848

# Get number of individuals from Geisinger passed QC CLAMMS CNV calling
find ${CNV_DIR}-name "*callset.samples.txt"  | xargs cat | grep -v AtlantiCare | wc -l
#133328

# Total number samples of fragmented chromosomes
ANU_FAIL=$(find ${CNV_DIR} -name "*.fragmented.chromosomes.txt"  | xargs cat | grep -v AtlantiCare | cut -f5 | sort | uniq | wc -l)
echo $ANU_FAIL
#356

# Number of samples that failed QC
TOTAL_SAMP=$(find ${CNV_DIR} -name "*samples.txt"| grep -v callset  | xargs cat | grep -v AtlantiCare | wc -l)
PASS_QC=$(find ${CNV_DIR}-name "*callset.samples.txt"  | xargs cat | grep -v AtlantiCare | wc -l)
FAIL_QC=$(echo ${TOTAL_SAMP} - ${PASS_QC} | bc )
echo $FAIL_QC
#2520

# Total number samples that failed for other reasons
echo $(echo ${FAIL_QC} - ${ANU_FAIL} | bc )
#2164
