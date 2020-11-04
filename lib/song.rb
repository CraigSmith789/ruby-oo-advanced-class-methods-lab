require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    s = self.new
    s.save
    s    
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(string)
    s = self.new
    s.name = string
    s
  end
  def self.create_by_name(string)
    s = self.new
    s.name = string
    @@all<<s 
    s
  end
  def self.find_by_name(string)
    @@all.detect{|s| s.name == string}
  end
  def self.find_or_create_by_name(string)
      dupe_check = self.find_by_name(string)
      if dupe_check == nil
        self.create_by_name(string)
      else
        dupe_check 
      end
  end
  def self.alphabetical
    @@all.sort_by{|song| song.name}

  end
  def self.new_from_filename(file)
    infod = file.slice!".mp3" #-----removes mp3
    info = file.split(/\s-\ /) #---removes - 
    song_name = info[1]
    artist_name = info[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song

  end
  def self.destroy_all
    @@all.clear

  end
  def self.create_from_filename(file)
    infod = file.slice!".mp3"
    info = file.split(/\s-\ /)
    song_name = info[1]
    artist_name = info[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    @@all<<song
    song

  end
  
end 