#!/usr/apps/bin/perl
#
# perl program to try the convergence for different functions
# when using Newtoon's method for f(x) = 0
# run with : perl newton.p
#
#
# Here is the generic file
$cmdFile="./newtonS.f90.Template";
$outFile="./newtonS.f90";

# Stuff to converge over

@array_f = ("x", "x*x", "sin(x)+cos(x*x)");
@array_fp = ("1.d0", "2.d0*x", "cos(x)-2.d0*x*sin(x*x)" );
@array_guess = ("1.d0", "1.d0", "1.d0" );

for( $m=0; $m < 3; $m = $m+1){
# Open the Template file and the output file.
open(FILE,"$cmdFile") || die "cannot open file $cmdFile!" ;
open(OUTFILE,"> $outFile") || die "cannot open file!" ;
# Setup the outfile based on the template
# read one line at a time.
    while( $line = <FILE> )
    {
# Replace the the stings by using substitution
# s
$line =~ s/\bFFFF\b/$array_f[$m]/;
$line =~ s/\bFPFP\b/$array_fp[$m]/;
print OUTFILE $line;
# You can always print to secreen to see what is happening.
# print $line;
    }
# Close the files
close( OUTFILE );
close( FILE );

# Run the shell commands to compile and run the program
system("gfortran $outFile");
system("./a.out > tmp.txt");

open(FILE,"tmp.txt") || die "cannot open file" ;
# Setup the outfile based on the template
# read one line at a time.
    while( $line = <FILE> )
    {
# Replace the the stings by using substitution
# s
$line =~ s/\s+/ , /g;
$line =  $line . "\n";
$line =~ s/ , $/ /;
$line =~ s/ , / /;
$line =~ s/^ , / /;
#"s/^ , / /;".
print $line;
    }
close( FILE );
}

exit
