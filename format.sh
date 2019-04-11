#!/bin/bash

regex='(.*?)'
replace='$1'

sed '/seconds/d; s/{/\\{/g; s/}/\\}/g; s/_/\\_/g' \
	| perl -p -e "s/'$regex'/\`$replace'/g" \
	| awk 'NF >= 6 && /^[ \t]*[0-9n]/ { 
for (i = 1; i <= NF; ++i) 
	{ 
		if (i < 6)
			{
				printf "%s & ", $i
			}
	else
		{
			printf "%s ", $i
		}
	} 
	printf "\\\\\n"j
}' \
	| sed 22q \
	| awk 'BEGIN { 
	printf "\\begin{figure}[h!]\n\\begin{center}\n\\begin{tabular}{| r r r r r | l |}\n\\hline\n" 
} 
{print}
END {
printf "\\hline\n\\end{tabular}\n\\end{center}\n\\caption{cProfile output}\\label{fig:cprof}\n\\end{figure}\n"
}' \
	| awk 'BEGIN {ncalls = 0} /ncalls/ { printf "%s\n\\hline\\hline\n", $0; ncalls = 1 } {if (ncalls == 0) { print } else {ncalls = 0}}'

