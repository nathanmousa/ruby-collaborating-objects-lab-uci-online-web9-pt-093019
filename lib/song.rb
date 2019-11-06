class Song
  attr_accessor :name, :artist
  @@all = []
  
  def initialize(name)
    @name = name
    save #Any particular reason to handle save in private?
  end
  
  def self.all
    @@all.dup.freeze #Dup Freeze?
  end
  
  def self.new_by_filename(filename)
    file_array = filename.split(" - ")
    song = new(file_array[1])
    song.artist_name=(file_array[0])
    song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
  
  def self.find_by_artist(artist)
    all.select {|song| song.artist == artist}
  end
  
  
  
  private
  def save
    @@all << self if !@@all.include?(self)
  end
end