use LWP::Simple;

@files = `ls *2014*.idx`;
for my $file (@files) {
  chomp $file;
  open IN, $file;
  @lines = <IN>;
  for my $line (@lines) {
    next unless $line =~ /\|10-K\|/;
    chomp $line;
    @line = split /\|/, $line;
    $path = $line[-1];
    $url = "http://www.sec.gov/Archives/$path";
    $datafile = (split /\//, $path)[-1];
    print "$datafile\n";
    getstore($url,"files/$datafile");
  }
}