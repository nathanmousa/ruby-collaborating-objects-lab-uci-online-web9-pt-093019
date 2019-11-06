class Artist
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    @@all.dup.freeze
  end
  
  def songs
    Song.find_by_artist(self)
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def self.find_by_name(name)
    all.detect {|artist| artist.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || Artist.new(name)
  end
  
  def print_songs
    songs.each {|song| puts song.name}
  end
  
  
  
  private
  def save
    @@all << self if !@@all.include?(self)
  end
end