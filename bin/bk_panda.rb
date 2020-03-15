#!/usr/bin/env ruby


PADDING = 60
BACKUP_DIR="/share/backup"

# get a new directory name
def get_dirname()
        t = Time.now
        dirname = t.year.to_s + "_" + t.month.to_s + "_" +  t.day.to_s \
          + "_" +  t.hour.to_s + "." + t.min.to_s + "." + t.sec.to_s
end

# formatting the output
# given a string, return a padded string at given length (num)
def format(str, num)
  len = str.length
  # if desired length is even less than given string, then 
  # do nothing, just return the original string
  if len >= num
    return str
  end
  
  # otherwise, let's see how many space is needed
  extra = num - len
  space = ""  
  (1..extra).to_a.each do |i|
    space += " "
  end
  return str + space
end

# backup svn database
def backup_svn(svnroot)

  puts "Subversion database dump"

  # collect all repos
  Dir.chdir(svnroot)
  svnrepo = Dir.glob("*")

  # create new directory if necessary
  Dir.chdir(BACKUP_DIR)  
  Dir.mkdir("svn") unless File.exists?("svn")
  Dir.chdir("svn")
  newdir = get_dirname()
  Dir.mkdir(newdir)
  savedir = BACKUP_DIR + "/" + "svn" + "/" + newdir

  svnrepo.each do |repo|
    svnpath = svnroot + "/" + repo
    backupf = savedir + "/" + repo

    cmd = "svnadmin dump #{svnpath} > #{backupf}"
    print format("backup #{svnpath}", PADDING)
    output = `#{cmd}`
    puts "[OK]"
  end
end



def main() 
  backup_svn("/opt/svn")
end


# main entry
main()
