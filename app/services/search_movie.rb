require 'dotenv'
Dotenv.load





class SearchMovie
def initialize
	@movies = []

  def perform
   configuration = Tmdb::Configuration.new
   Tmdb::Api.key(ENV["SECRET_KEY"])
   Tmdb::Api.language('en')

  @findmovie = Tmdb::Movie.find('prout')
  @findmovie.each do |movie|
  	@info = {}
    @moviehash = Tmdb::Movie.credits(movie.id)
    @moviedetails = Tmdb::Movie.detail(movie.id)
	@info[:title] = @moviedetails["title"]  
	@info[:date] = @moviedetails["release_date"]
		if  @moviedetails["poster_path"]
			@imageok = configuration.base_url + configuration.poster_sizes[3] + @moviedetails["poster_path"]
			@info[:image] = @imageok
			else
			@imagenotok = "http://image.noelshack.com/fichiers/2018/45/4/1541681140-noposter.jpg"
			@info[:image] = @imagenotok
			end


		@moviecrew = @moviehash.fetch("crew")
		@moviecrew.each do |infocrew|
		if infocrew["job"] == "Director"
		@info[:director] = infocrew["name"]	
		end
	@movies.push(@info)
	p @movies
  end
end
  end
    
  
  
   
  



end
end