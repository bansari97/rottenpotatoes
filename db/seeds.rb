# Seed the RottenPotatoes DB with some movies.
# Uses find_or_create_by! keyed on title so running `rails db:seed`
# more than once never creates duplicate movies.
more_movies = [
  { title: "My Neighbor Totoro", rating: "G",
    release_date: "16-Apr-1988" },
  { title: "Green Book", rating: "PG-13",
    release_date: "16-Nov-2018" },
  { title: "Parasite", rating: "R",
    release_date: "30-May-2019" },
  { title: "Nomadland", rating: "R",
    release_date: "19-Feb-2021" },
  { title: "CODA", rating: "PG-13",
    release_date: "13-Aug-2021" },
  { title: "Spirited Away", rating: "PG",
    release_date: "20-Jul-2001" },
  { title: "Everything Everywhere All at Once", rating: "R",
    release_date: "25-Mar-2022" },
  { title: "Oppenheimer", rating: "R",
    release_date: "21-Jul-2023" },
  { title: "Inside Out", rating: "PG",
    release_date: "19-Jun-2015" }
]

more_movies.each do |movie|
  Movie.find_or_create_by!(title: movie[:title]) do |m|
    m.rating = movie[:rating]
    m.release_date = movie[:release_date]
  end
end
