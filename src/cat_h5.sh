qual20_dir=$1
for i in {1..22} X;
do
    chr_num="chr"$i
    cat $qual20_dir$chr_num"_cb.h5">>$qual20_dir"all_cb.h5"
    
done

touch $qual20_dir"report.txt"
echo "Mu_FL(Kb):" >> $qual20_dir"report.txt"
mufl=`awk '{ total += $4 } END { print total/NR }' $qual20_dir"all_cb.h5"`
xx=1000
mufl2=$(echo $mufl $xx | awk '{printf "%4.3f\n",$1/$2}') 
echo $mufl2 >> $qual20_dir"report.txt"

echo "Number of Fragments:" >> $qual20_dir"report.txt"
nf=`cat $qual20_dir"all_cb.h5" | wc -l`
echo $nf >> $qual20_dir"report.txt"

echo "Number of read pairs:" >> $qual20_dir"report.txt"
nrp2=`awk '{ total += $5} END { print total}' $qual20_dir"all_cb.h5"`
xy=2
nrp=`echo $((nrp2 / xy))` 
echo $nrp >> $qual20_dir"report.txt"
 
total=$(echo $mufl $nf  | awk '{printf "%4.1f\n",$1*$2}') 
#echo $total >> $qual20_dir"report.txt"

echo "Cf (Coverage of fragments):" >> $qual20_dir"report.txt"
wgslen=3110483063
Cf=$(echo $total $wgslen | awk '{printf "%4.3f\n",$1/$2}') 
echo $Cf >> $qual20_dir"report.txt"

echo "Cr (Coverage of reads):" >> $qual20_dir"report.txt"
xz=2
readslen=151
Cr=$(echo $nrp $xz $readslen $total | awk '{printf "%4.3f\n",$1*$2*$3/$4}') 
echo $Cr >> $qual20_dir"report.txt"

echo "C (Total Coverage):" >> $qual20_dir"report.txt"
C=$(echo $Cf $Cr | awk '{printf "%4.3f\n",$1*$2}') 
echo $C >> $qual20_dir"report.txt"


