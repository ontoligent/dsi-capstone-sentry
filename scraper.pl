use LWP::Simple;
use strict;

&download_daily_docs();

sub download_daily_docs {
  my $url1 = "http://www.sec.gov/cgi-bin/current.pl?q1=0&q2=0&q3=";
  my $doc1 = get($url1);
  my @doc1 = split /\n/, $doc1;
  for my $line1 (@doc1) {
    if ($line1 =~ /<a href="\/(Archives\/edgar\/data\/\d+\/(\d+-\d+-\d+)-index.html)">10-K/) {
      my $id = $2;
      my $url2 = "http://www.sec.gov/$1";
      my $doc2 = get($url2);
      my @doc2 = split /\n/, $doc2;
      for my $line2 (@doc2) {
        if ($line2 =~ /<td scope="row"><a href="(\/Archives\/edgar\/data\/\d+\/\d+\/.+10k.htm)"/) {
          my $url = "http://www.sec.gov$1";
          my $tenkfile = "docs-10k/${id}_10k.html";
          print "OUTFILE: $tenkfile\n";
          getstore($url,$tenkfile);
          last;
        }    
      }      
    }
  }
}
