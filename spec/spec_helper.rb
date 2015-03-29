require 'pry'
require 'digest/sha1'

RSpec.configure do |config|
  # config here
end

def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read
  file.close
  return data
end

def __
  raise "Replace __ with your answer"
end

def encode(string)
  Digest::SHA1.hexdigest(string)
end
