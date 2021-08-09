def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie
    .select(:id, :title, :score)
    .select(:yr)
    .where(yr: 1980..1989)
    .where(score: 3..5)

end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie
    .group(:yr)
    .having('MAX(score) < 8').pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor
    .joins(:movies)
    .where(movies: {title: title})
    .order('castings.ord')
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.

  Movie
    .select('movies.id, movies.title, actors.name') # HAVE to be specific
    .joins(:actors)
    .where('movies.director_id = castings.actor_id') # don't have to be specific here, is actor_id vs castings_actor_id
    .where('castings.ord = 1')

    # actually in all three tables: movies, castings, actors
    #

end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.

  Actor
    .select('actors.id, actors.name, COUNT(castings.actor_id) as roles')
    .joins(:castings)
    .where.not(castings: { ord: 1 })
    .group(:id) # defaults to left
    .order('roles DESC')
    .limit(2)
end

# :LHS
# RHS:

# :col_name
# 'aggregate function'
# 'table_name.col_name'
