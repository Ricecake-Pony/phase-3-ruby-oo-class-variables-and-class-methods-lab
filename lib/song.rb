require 'pry'
class Song
    # attr_reader :name, :artist, :genre, :@@artists
    
    @@count = 0 # declare the class variable in the class at the top so it can be placed in all instances below.
    @@artists = []
    @@genres = []
    
    def initialize name, artist, genre
        @name = name
        @artist = artist
        @genre = genre
        @@count += 1
        @@artists << self.artist
        @@genres << self.genre
    end

    def name
        @name
    end

    def artist
        @artist
    end

    def genre
        @genre
    end

    def Song.count
        @@count
    end

    def Song.artists
        @@artists.uniq
    end
    
    def Song.genres
        @@genres.uniq
    end
    
    def Song.genre_count
        @@genres.tally
        # binding.pry
    end

    def Song.artist_count
        @@artists.tally
    end
end

#HOLY SNAP! I was stuck here forever, and had to watch the elcture to give mem an idea of where I went wrong. 
# What did you do to get it to work? 
# ?? 1st: I had to create a class variable for artists (@@artists = []) I made it an empty array as the value was an array with the artists inside. Arrays are better for a list of data so [] is a good move, right?
# ???2nd: Now that we have the variable, we need to apply it to every instance. (Do that inside the #initialize because that is a template for every instance more or less.) Um not exactly sure why though. Do we really want that array passed to every instance of Song? I used @@artists << self.artist to push every artist defined in #initialize into the class variable array. Then we need our getter/reader method ie: 
# def Song.artists
#     @@artists
# end
# 
# Now I'm stuck on the same class method Song.artists as it's supposed to be giving an arraay.. Which via pry it is returning ["Jay-Z", "Jay-Z", "Brittany Spears"].. Error: expected ["Jay-Z", "Jay-Z", "Brittany Spears"] to match ["Jay-Z", "Brittany Spears"] What the French Toast?! So I need to get rid of my duplicate?? THANK GOD! There's an array method array.uniq
# 
# Now I'm stuck on Song.genre_count Error: Failure/Error: expect(Song.genre_count).to eq({ "pop" => 1, "rap" => 2 })
#    expected: {"pop"=>1, "rap"=>2}
#    got: 3
#  my code: @@genres.count @@genres => ["rap", "rap", "pop"] There's this nifty array memthod called array.tally! #Overtenyearoldthreadftw
# 
