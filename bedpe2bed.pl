#!/usr/bin/perl
#chr14			0
#75538815		1
#75538908		2
#chr14			3
#75538847		4
#75538908		5
#A00405:44:HC3HHDSXX:1:1101:1072:11522 6
#2	7
#+	8
#-	9

open(FILE,$ARGV[0]) || die "$!\n";
while(chomp($line=<FILE>)){
	@temp = split/\t/,$line;
	if($temp[0] eq $temp[3]){
		if($temp[8] eq "+" && $temp[9] eq "-"){
			$len = $temp[5]-$temp[1];
			print "$temp[0]\t$temp[1]\t$temp[5]\t$len\t.\t+\n" if($len>0 && $len<=700);
		}elsif($temp[8] eq "-" && $temp[9] eq "+"){
			$len = $temp[2] - $temp[4];
			print "$temp[0]\t$temp[4]\t$temp[2]\t$len\t.\t-\n" if($len>0 && $len<=700);
		}
	}
}
close(FILE);
