#!/usr/local/bin/perl

use strict;
use warnings;

$\="\n";

my $file='expense_db.txt';

# alarm sub-routine
sub calc{
	#print shift @_;
	my $time = shift @_;
	my $link= shift @_;
	
	print "Alarm set after $time seconds";

}

sub add_exp{
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

        my @exp = ($exp_tit, $exp_cat, $exp_amt);
        print "@exp";
        my $exp_entry= join "\t",@exp;
        print "Entry: $exp_entry";
        print "Adding the Entry {Tit:$exp_tit Cat:$exp_cat Amt:$exp_amt}";

        open FH, '>>', $file or die $!;
        print FH $exp_entry;

        close FH;

}

sub show_exp{
	printf "|%15s|%15s|%10s|\n", 'Item','Category','Amount';
	print "|------------------------------------------|";
	my $total=int(0);
	open FH, '<', $file or die $!; 
	while( <FH>){
		#print $_;
		my @exp_entry= split "\t", $_;
		my $tit = shift @exp_entry;
		my $cat = shift @exp_entry;
		my $amt = shift @exp_entry;
		chomp $amt;
		$total+=int ($amt);
	        printf "|%15s|%15s|%10s|", $tit,$cat,$amt;

	print "";
	}
	close FH;

	print "|------------------------------------------|";
        printf "|%15s|%15s|%10s| \n", 'Total',"",$total;
	print "|------------------------------------------|";
	#	print "Category Wise Distribution\n"

}

print "Your Expense Tracker System.\nEnter your choice \n1. Add Expense \n2. Expense Analysis \n3. Reset the Expense Tracking";
my $ch = int(<STDIN>);
print $ch;

if($ch == 1){
	add_exp;

}
elsif($ch == 2){
	print "Showing the Expense Analysis Report";
	show_exp;
}
elsif($ch == 3){
	print "Are you sure? 1.Yes 2.No ";
	my $op = int(<STDIN>);
	if($op == 1){
		print "Reseting the Expense Report";
		`rm $file`;
	}
	else{
		exit 1;
	}
}

