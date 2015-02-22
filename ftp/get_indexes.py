import urllib

years = range(2012,2015)
qtrs  = range(1,5)
idx   = 'master'

for year in years:
  year = str(year)
  for qtr in qtrs:
    qtr = str(qtr)
    print "Getting", year, "Q", qtr
    u = 'ftp://ftp.sec.gov/edgar/full-index/'+year+'/QTR'+qtr+'/'+idx+'.gz'
    f = urllib.urlopen(u)
    c = f.read()
    o = open('indexes/'+idx+'-'+year+'-Q'+qtr+'.gz','w+')
    o.write(c)
    o.close()

    