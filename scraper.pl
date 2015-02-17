use LWP::Simple;
use strict;

&download_daily_docs();

sub download_daily_docs {
  my $url1 = "http://www.sec.gov/cgi-bin/current.pl?q1=0&q2=0&q3=";
  my @lines1 = &getlines($url1);
  for my $line1 (@lines1) {
    if ($line1 =~ /<a href="\/(Archives\/edgar\/data\/\d+\/(\d+-\d+-\d+)-index.html)">10-K/) {
      my $id = $2;
      my $tenkfile = "docs-10k/${id}_10k.html";
      if (-e $tenkfile) {
        print "$tenkfile aleady exists\n";
        next;
      }
      my $url2 = "http://www.sec.gov/$1";
      my @lines2 = &getlines($url2);
      for my $line2 (@lines2) {
        if ($line2 =~ /<td scope="row"><a href="(\/Archives\/edgar\/data\/\d+\/\d+\/.+10k.htm)"/) {
          my $url = "http://www.sec.gov$1";
          print "Creating $tenkfile\n";
          getstore($url,$tenkfile);
          last;
        }    
      }      
    }
  }
}

sub getlines {
  my $url = shift;
  my $doc = get($url);
  my @lines = split /\n/, $doc;
  return @lines;
}
