movies = [
  {
    title: "Ello Gov'nor",
    description: %q(
      A horror film starring a taxi possessed by the
      driver's soul seeking vengeance on the gang
      members responsible for murdering him.
    ),
    image: "ello-govnor.png",
    year: 2010,
  },

  {
    title: "The Best VHS in the World",
    description: %q(
      A dog drives a car off of a dock, and then gets
      beamed into a space ship...
      It's a gold-colored VHS tape that attracts gnomes.
      Avoid renting it at all costs.
    ),
    image: "best-vhs.jpeg",
    year: 2012,
  },

  {
    title: "Zombocalypse (3D Director's Cut)",
    description: "The only zombie film that can raise the dead.",
    image: "zombocalypse.png",
    year: 2011,
  },

  {
    title: "Shy Guy",
    description: "Lame plot about a guy who is shy.",
    image: "shy-guy.png",
    year: 2011,
  },

  {
    title: "Future War 4",
    description: "Robots! Destruction!",
    image: "future-war-4.png",
    year: 2020,
  },

  {
    title: "Planet Chasers Starlight Excellent",
    description: %q(
      Watch Planet Chasers Starlight Excellent all day,
      every day. All day, every day.
    ),
    image: "pcse.jpg",
    year: 2005,
  },

  {
    title: "Antonio Antomoletti's Ciao Chow",
    description: "It's like Cujo, I suppose?",
    image: "ciao-chow.png",
    year: 2011,
  },

  {
    title: "Re-Exploder",
    description: "It explodes. Then it explodes, _again_.",
    image: "re-exploder.png",
    year: 1989,
  },

  {
    title: "Let Me Axe You Something",
    description: "I hope you like puns...",
    image: "axe.png",
    year: 1999,
  },

  {
    title: "21-12 Time Attack: Directors Cut",
    description: %(
      Unfortunately, you cannot watch this because it is
      on LaserDisc and the Ancient Order of the VHS
      destroyed all LaserDisc players.
    ),
    image: "21-12-time-attack.png",
    year: 1999,
  },
]

movies.each do |movie_params|
  movie = Movie.find_or_initialize_by(title: movie_params[:title])
  movie.update_attributes(movie_params)
end
