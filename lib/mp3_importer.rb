class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.children(path) #How does this work?
  end
  
  def import
    files.each { |filename| Song.new_by_filename(filename) } #What does files refer to?
  end
end