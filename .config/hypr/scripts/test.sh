# print all the arguments of this sh file with a "|" in between them using a for loop

for arg in $@
do
    echo -n $arg"|" >> output.txt
done
