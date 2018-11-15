require "pry"

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  extend Concerns::Findable

  @@all = []
  
  def initialize(name, artist_obj=nil, genre_obj = nil)
    @name = name
    self.genre=(genre_obj) if genre_obj != nil
    self.artist=(artist_obj) if artist_obj != nil
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    # 
    # @@all.clear
    # below is better because it doesnt rely on the class var
    
    self.all.clear
  end
  
  def save
    # 
    # @@all.push(self)
    # below is better because it doesnt rely on the class var

    self.class.all.push(self)
  end

  def artist=(artist_obj)
    @artist = artist_obj
    
    artist_obj.add_song(self)
  end
  
  def genre=(genre_obj)
    @genre = genre_obj
    
    genre_obj.add_song(self)
  end
end

