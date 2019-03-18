
#!/bin/sh
pdftotext -nopgbrk result1.pdf
grep --no-group-separator -A3 'CHN17CS' result1.txt | tr '\n' ' ' | sed 's/\ CHN/\nCHN/g' > result.txt
cat result.txt
sed -i 's/(O)/ 10 /g' result.txt
sed -i 's/(A+)/ 9 /g' result.txt
sed -i 's/(A)/ 8.5 /g' result.txt
sed -i 's/(B+)/ 8 /g' result.txt
sed -i 's/(B)/ 7 /g' result.txt
sed -i 's/(C)/ 6 /g' result.txt
sed -i 's/(P)/ 5 /g' result.txt
sed -i 's/(F)/ 0 /g' result.txt
sed -i 's/(FE)/ 0 /g' result.txt
sed -i 's/(I)/ 0 /g' result.txt
cat result.txt
awk '{s=$3*4+$6*4+$9*4+$12*3+$15*3+$18*3+$21*1+$24*1+$27*1}{r=s/24}{print r}' result.txt >sgpa.txt
cat sgpa.txt
paste -d ' \t ' result.txt sgpa.txt
awk '{print $1}' result.txt >reg.txt
cat reg.txt
paste -d ' \t ' reg.txt sgpa.txt
paste -d ' \t ' reg.txt sgpa.txt >res.txt
awk 'NR==FNR {seen[$3]=1; next} seen[$1]==1 {seen[$2]++; print $2}' s4d.txt res.txt >s1sgpa.txt
cat s1sgpa.txt
awk '{print $3}' s4d.txt >reg1.txt
cat reg1.txt
paste -d ' \t ' reg1.txt s1sgpa.txt >s1final.txt
cat s1final.txt
pdftotext -nopgbrk result2.pdf
 grep --no-group-separator -A3 'CHN17CS' result2.txt | tr '\n' ' ' | sed 's/\ CHN/\nCHN/g' > results2.txt
cat results2.txt
sed -i 's/(O)/ 10 /g' results2.txt
sed -i 's/(A+)/ 9 /g' results2.txt
sed -i 's/(A)/ 8.5 /g' results2.txt
sed -i 's/(B+)/ 8 /g' results2.txt
sed -i 's/(B)/ 7 /g' results2.txt
sed -i 's/(C)/ 6 /g' results2.txt
sed -i 's/(P)/ 5 /g' results2.txt
sed -i 's/(F)/ 0 /g' results2.txt
sed -i 's/(FE)/ 0 /g' results2.txt
sed -i 's/(I)/ 0 /g' results2.txt
cat results2.txt
awk '{s=$3*4+$6*3+$9*3+$12*1+$15*1+$18*4+$21*3+$24*3+$27*1}{r=s/23}{print r}' results2.txt >s2sgpa.txt
cat s2sgpa.txt
paste -d ' \t ' results2.txt s2sgpa.txt
awk '{print $1}' results2.txt >reg2.txt
cat reg2.txt
paste -d ' \t ' reg2.txt s2sgpa.txt >resu.txt
cat resu.txt
awk 'NR==FNR {seen[$3]=1; next} seen[$1]==1 {seen[$2]++; print $2}' s4d.txt resu.txt >sgpas2.txt
cat sgpas2.txt
awk '{print $3}' s4d.txt >reg1.txt
cat reg1.txt
paste -d ' \t ' reg1.txt sgpas2.txt >s2final.txt
cat s2final.txt
paste -d ' \t ' s1final.txt sgpas2.txt >s1_s2.txt
cat s1_s2.txt
awk '{s=$2+$3}{r=s/2}{print r}' s1_s2.txt >cgpa.txt
cat cgpa.txt
paste -d ' \t ' reg1.txt cgpa.txt >final_cgpa.txt
cat final_cgpa.txt
