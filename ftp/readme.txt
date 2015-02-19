Info for directly accessing EDGAR data can be found here

    http://datahub.io/dataset/edgar

They give a good overview. For example, they show how URLs are
constructed so that you can grab directly indices of contents:

    ftp://ftp.sec.gov/edgar/full-index/{YYYY}/QTR{1-4}/{index-name}.[gz|zip]

They also link to sites like this one:

    http://www.secdatabase.com/

You can also find info on the EDGAR site itself at this URL:

    http://www.sec.gov/cgi-bin/edgar_indices

    http://www.sec.gov/edgar/indices/fullindex.htm

    http://www.sec.gov/edgar/searchedgar/ftpusers.htm

Below is a text version of the second (alas with no links):

Information for FTP Users
-------------------------

The Securities & Exchange Commission's File Transfer Protocol (FTP)
server for EDGAR filings allows comprehensive access to the SEC's
EDGAR (Electronic Data Gathering, Analysis, and Retrieval system)
filings by corporations, funds, and individuals. These filings are
disseminated to the public through the EDGAR Dissemination Service,
currently operated under contract to Keane Federal Systems, which
markets data directly to subscribers.

After early testing in 1992-93, beginning with 450 voluntary filers,
companies began filing through EDGAR in 1994-95 with various phase-in
periods for different form types. See Electronic Filing and the EDGAR
System: A Regulatory Overview for more historical details.

To use anonymous FTP to access the EDGAR FTP server, use your FTP
software to connect to ftp://ftp.sec.gov and log in as user
"anonymous," using your electronic mail address as the password.

To preserve equitable server access, we ask that bulk FTP transfer
requests are performed between 9 PM and 6 AM Eastern time. Please use
efficient scripting, downloading only what you need and space out
requests to minimize server load.  Note: We do not offer technical
support for developing or debugging scripted downloading processes.

Using the EDGAR Index Files
---------------------------

The EDGAR indices are a helpful resource for FTP retrieval, listing
the following information for each filing: Company Name, Form Type,
CIK, Date Filed, and File Name (including folder path).

Four types of indexes are available:

    company — sorted by company name
     
    form — sorted by form type
     
    master — sorted by CIK number
     
    XBRL — list of submissions containing XBRL financial files, sorted
    by CIK number; these include Voluntary Filer Program submissions

Indexes are located in the following folders according to time period indexed:

    /edgar/daily-index — daily index files through the current year; previous year folders are available through 1994Q3
     
    /edgar/full-index — year folders contain quarterly indexes. Full
    indexes offer a "bridge" between Quarterly and Daily indexes,
    compiling filings for the previous business day through the
    beginning of the current quarter.

The following archive formats are available:

    ZIP compatible — .zip extension (e.g., master.zip)
     
    Macintosh StuffIt — .sit extension (e.g., master.sit)
     
    UNIX compress — .Z extension (e.g., master.Z)

Notes on Directory Structure
----------------------------

Raw text filings can be accessed via the paths indicated in the
indexes, for example:

/edgar/data/CIK/0123456789-AB-CDEFGH.txt

Post-EDGAR 7.0 filings (after May 26, 2000) are also accessible via an
alternative symbolic path incorporating an intermediate folder named
by the accession number without dashes. All the documents submitted
for a given filing will be in this folder:

/edgar/data/CIK/0123456789ABCDEFGH/0123456789-AB-CDEFGH.txt

Other documents that may be of interest:

    /edgar/data/CIK/0123456789ABCDEFGH/0123456789-AB-CDEFGH-index.htm
     
    (The HTML version includes hyperlinked table of submitted
    documents.)
     
    /edgar/data/CIK/0123456789ABCDEFGH/0123456789-AB-CDEFGH.hdr.sgml
     
    (The SGML header contents)

Important Note re: Data folder — The /edgar/data folder will show as
empty. There are so many (tens of thousands) folders and files in this
directory that access is not allowed. You'll need to "leapfrog" over
the /data folder to include the subsequent CIK folder(s) in the filing
path (/edgar/data/CIK/).  Getting the Actual Text Files

The following instructions relate to command-line FTP retrieval. Many
FTP users will use programs that have a graphical interface, but the
approach is similar and leapfrogging over the /data folder may still
require manual entry of a full folder path as indicated in the
indexes. To start with the indexes indicated above:

ftp> cd edgar/full-index
ftp> get company.idx

If you are downloading compressed files, remember to use binary mode.

The indexes indicate the paths and names of the text files. For
example, the index might contain the following file name and path:

/edgar/data/100334/0000100334-06-000121.txt

To retrive this file:

ftp> cd edgar
ftp> cd data/100334/
ftp> get 0000100334-06-000121.txt
Notes on Filings

Indexes are updated each evening for the current business day's
filings. Filing submissions that begin after 5:30 pm Eastern Time (10
pm for Ownership forms 3, 4, 5), will be disseminated the next
business day, showing up in the following business day's index.

Filings are sometimes removed or corrected for a variety of reasons at
the filer's request including, but not limited to, the document was
submitted for the wrong filer, the document was a duplicate of a
previously filed document, the document in its current form was
unreadable, or the document contained sensitive
information. Corrections processed during a given business day will be
incorporated in the index processed that evening. However, removals
processed on subsequent business days will not be reflected in any
previous indexes; hence a few filings will no longer be accessible at
the locations indicated in these indexes.

Corrections are noted in the Feed directory.

Feed and Oldloads Folders
-------------------------

Feed — The Feed directory contains a tar and gzip archive file (e.g.,
20061207.nc.tar.gz; nc stands for non-cooked) for each filing
day. Each filing compressed in the tar is a separate filing
submission.

Oldloads — The Oldloads files contain a single concatenated copy of
all filing submissions for that day (e.g., 20061207.gz) complete with
the filing header. Corrections to previous filings, including
deletions, are included in the oldloads files. Note that EDGAR index
files are not subsequently edited to reflect these deletions.  

Paper Filings
-------------

For filings not available through EDGAR, paper versions are available
through the SEC Office of Investor Education. See How to Request
Public Documents for more information. If you need certified copies of
records or documents, your request should be submitted to
certified@sec.gov.  

Documentation and Helpful Resources
-----------------------------------

    Current list of all CIKs matched with entity name (13 MB,
    textfile) Note that this list includes funds and individuals and
    is historically cumulative for company names. Thus a given CIK may
    be associated with multiple names in the case of company or fund
    name changes, and the list contains some entities that no longer
    file with the SEC.
     
    Descriptions of EDGAR Form Types
     
    Content of specific forms
     
    Current EDGAR Filer Manual, XFDL and XML specs, and other
    materials for EDGAR filers
     
    XBRL Interactive Data initiative
     
    XSLT Stylesheets for HTML Rendering of EDGAR XML Filings
     
    Interactive Data Filings and RSS Feeds, i	ncluding monthly archive

Troubleshooting
---------------

Common FTP access problems include:

    operating in active mode — the FTP requires passive mode (PASV)
     
    local firewall issues — check to make sure that you can access
    other FTP sites.

Contact Information
-------------------

    webmaster@sec.gov — connection issues and general questions
     
    EDGAR Filer Support — for EDGAR Filer queries, call 202-551-8900
     
    EDGAR Dissemination System: Contact Information — for subscribing to the the EDGAR dissemination feed
     
    For general SEC Contact information, including electronic
    mailboxes, telephone numbers, and mailing addresses, see Contact
    Us.


http://www.sec.gov/edgar/searchedgar/ftpusers.htm
