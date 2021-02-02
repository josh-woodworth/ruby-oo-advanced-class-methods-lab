require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  @@all << self

  def self.create
    song = Song.new()
    @@all << song
    return song
  end

  def self.new_by_name(song_name)
    song = Song.new()
    song.name = song_name
    @@all << song
    return song
  end

  def self.create_by_name(song_name)
    song = Song.new()
    song.name = song_name
    @@all << song
    return song
  end

  def self.find_by_name(song_name)
    found_song = self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    find = self.find_by_name(song_name)
    if find
      find
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |object|
      object.name
    end
  end

  def self.new_from_filename(filename)
    artist = filename.split('-')[0].strip
    song = filename.split('-')[1].split('.')[0].strip

    new_song = Song.new
    new_song.name = song
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end
