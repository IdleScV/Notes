#* Lets say we have Song, Artist, and Genre classes
#* All of them have their own table.

#* We want to connect them with a foreign key, and in this instance, Song wil be the holder of those keys.

class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
end
Artist.new(name: 'Adele')
    #? Example...
        # => #?<Artist:0x007fc75b8d9490 id: 1, name: "Adele">


class Genre < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs
end
Genre.new(name: 'pop')
    #? Example...
        # => #?<Genre:0x007fa34338d270 id: 1, name: "pop">


class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
end
hello = Song.new(name: 'Hello')
    #? Example...
        # => #?<Song:0x007fc75a8de3d8 id: 1, name: "Hello", artist_id: nil, genre_id: nil>

#* Note! 
#* If you tell the child that it belongs to the parent, the parent won't know about that relationship. 
#* If you tell the parent that a certain child object has been added to its collection, both the parent and the child will know about the association.

#* Now how do we connect these things?
hello.artist = adele
 # => #? <Song:0x007fc75a8de3d8 id: nil, name: "Hello", artist_id: 1, genre_id: nil>
hello.genre = pop
 # => #? <Song:0x007fc75a8de3d8 id: nil, name: "Hello", artist_id: 1, genre_id: 1>
adele.songs
 # => #? []
pop.songs
 # => #? []
adele.songs.push(hello)
 # => #? [#<Song:0x007fc75a8de3d8 id: nil, name: "Hello", artist_id: nil, genre_id: nil>]
pop.songs << hello
 # => #? [#<Song:0x007fc75a8de3d8 id: nil, name: "Hello", artist_id: 1, genre_id: 1>]


#!  Migrations
#* 001
    class CreateSongs < ActiveRecord::Migration[4.2]
    def change
      create_table :songs do |t|
        t.string :name
        t.integer :artist_id
        t.integer :genre_id
      end
    end
  end
#* 002
  class CreateArtists < ActiveRecord::Migration[4.2]
    def change
      create_table :artists do |t|
        t.string :name
      end
    end
  end
#* 003
  class CreateGenres < ActiveRecord::Migration[4.2]
    def change
      create_table :genres do |t|
        t.string :name
      end
    end
  end