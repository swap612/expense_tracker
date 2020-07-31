#!/usr/local/bin/perl

use strict;
use warnings;

$\="\n";

# alarm sub-routine
sub calc{
	#print shift @_;
	my $time = shift @_;
	my $link= shift @_;
	
	print "Alarm set after $time seconds";

}


# start 
print "Your Expense Tracker System.\nEnter your choice \n1. Add Expense \n2.Expense Analysis";
my $ch = int(<STDIN>);
print $ch;

if($ch == 1){
	print "Enter the Expense Details";
	print "Expense Title";
	my $exp_tit =<STDIN>;
	chomp $exp_tit;

	print "Expense Category";
        my $exp_cat =<STDIN>;
        chomp $exp_cat;
	
	print "Expense Amount";
        my $exp_amt =<STDIN>;
        chomp $exp_amt;

	print "Adding the Entry {Tit:$exp_tit Cat:$exp_cat Amt:$exp_amt}"

}
elsif($ch == 2){

	print "Showing the Expense Analysis Report";
	#my $input =<STDIN>;
	#chomp $input;
	#print $input;
	
}

my $file='expense_db.txt';
