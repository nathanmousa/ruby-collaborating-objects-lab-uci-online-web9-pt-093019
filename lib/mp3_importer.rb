require 'pry'

class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    binding.pry
    Dir.children(path) #How does this work?
  end
  
  def import
    files.each { |filename| Song.new_by_filename(filename) }
  end
end