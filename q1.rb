# ww coding challenge
# by Xiao Meng Wei
# Jan 20 2019
#
# Question 1:
#
# There is a file containing a word and its possible meanings (like a Dictionary). The contents of the file look like this:
#
# Apple – a fruit, a tech firm
# Table – an object, contains rows and columns when used in context of computers
# Orange – a fruit
#
# Given a path to the file, do the following:
# a) Create a method called doesFileExist(String path) which takes the path of the file and tells the user if the file exists at that path or not. Assume all paths are relative to your project structure. If the file does not exist, catch the requisite exception.
# b) Read each word and its possible meanings and print them out. Your output should look like this:
#
# Word1
# Meaning 1
# Meaning 2
# Word2
# Meaning1
# Meaning2
#
# Use appropriate data structures wherever necessary.
#

def doesFileExist(file)
  File.exist?(file)
end

if ARGV.size == 1
  dict = ARGV[0]
else
  puts "!!! Incorrect number of arguments !!!\nUsage: q1.rb [dict-path]"
  exit 1
end

if doesFileExist(dict)

  # process file line by line using File.foreach to avoid slurping
  # each line should be in the format of:
  # WORD – meaning1, meaning2
  # all possible meanings must be separated by comma ','
  #
  # Note: notice the difference between – and -
  # the first is directly copied from Vlad's question
  # the second is the standard hyphen input from keyboard

  File.foreach(dict) do |line|
    if !line.gsub(/\s+/, "").empty?  # checks if line is empty first
      entry = line.split('–')
      meanings = entry[1].split(',')
      puts entry[0].strip  # print the word
      meanings.each do |meaning|
        puts meaning.strip # print all meanings
      end
    end
  end

else
  puts "!!! File #{dict} not found !!!\nExample: ruby q1.rb dict"
  exit 1
end

