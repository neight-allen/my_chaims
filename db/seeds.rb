class Seed
  def initialize
    generate_artists
    generate_albums
    generate_songs
  end

  def generate_artists
    puts "Start Artists"
    50.times do
      Artist.create(name: Faker::Name.name)
    end
  end

  def generate_albums
    puts "Start Albums"
    years = (1965..2015).to_a
    250.times do |i|
      artist = Artist.all.sample
      puts "created album #{i}"
      Album.create(title: "#{Faker::App.name} #{Faker::App.name}", year: years.sample.to_s, artist_id: artist.id)
    end
  end

  def generate_songs
    puts "Start Songs"
    500.times do
      artist = Artist.all.sample
      album  = Album.all.sample
      Song.create(title: "#{Faker::Hacker.ingverb.capitalize} #{Faker::Team.creature}", artist_id: artist.id, album_id: album.id)
    end
  end
end

Seed.new
