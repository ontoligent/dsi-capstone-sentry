import glob, requests, os.path, gzip

base_url  = "http://www.sec.gov/Archives/"
file_mask = "indexes/*.gz"
out_dir   = "/scratch/rca2t"

for idx_file in glob.glob(file_mask):
  idx = gzip.open(idx_file,'rb')
  for line in idx.readlines():
    if line.find('|10-K|') != -1:
      line = line.rstrip()
      cells = line.split('|')
      path = cells[-1].split('/')
      outfile_name = out_dir+'/'+path[-1]
      if (os.path.isfile(outfile_name)):
        print outfile_name, "exists"
      else:
        r = requests.get(base_url+cells[-1])
        outfile = open(outfile_name,'w+')
        outfile.write(r.text.encode('utf-8').strip())
        outfile.close()
  idx.close()