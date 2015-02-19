import glob, requests, os.path

base_url = 'http://www.sec.gov/Archives/'

for idx_file in glob.glob("*2014*.idx"):
  idx = open(idx_file)
  for line in idx.readlines():
    if line.find('|10-K|') != -1:
      line = line.rstrip()
      cells = line.split('|')
      path = cells[-1].split('/')
      outfile_name = 'files/'+path[-1]
      if (os.path.isfile(outfile_name)):
        print outfile_name, "exists"
      else:
        r = requests.get(base_url+cells[-1])
        outfile = open(outfile_name,'w+')
        outfile.write(r.text.encode('utf-8').strip())
        outfile.close()
	  