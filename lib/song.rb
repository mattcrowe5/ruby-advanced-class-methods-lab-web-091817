require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.save
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    song1 = find_by_name(song_name)
    song2 = create_by_name(song_name)
    if song1 == nil
      song2
    else
      song1
    end
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    split_name = file_name.split(" - ")
    artist_name = split_name[0]
    song_name = split_name[1].gsub(".mp3",'')

    song = new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    split_name = file_name.split(" - ")
    artist_name = split_name[0]
    song_name = split_name[1].gsub(".mp3",'')

    song = create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    all.clear
  end









end
