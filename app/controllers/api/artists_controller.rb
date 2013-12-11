class Api::ArtistsController < ApplicationController

	def index
		respond_with artists
	end

	def show
		logger.debug artist.versions.to_yaml
		respond_with artist
	end

	def create
    @artist = Artist.create(artist_params)
    respond_with @artist, location: api_artists_url(@artist)
	end

	def update
    artist.update(artist_params)
    respond_with artist, location: api_artists_url(artist)
	end

	def destroy
		artist.destroy
    respond_with artist, location: api_artists_url
	end

	private
	def artists
		@artists ||= Artist.all
	end

	def artist
		@artist ||= Artist.find(params[:id])
	end

  def artist_params
    params.require(:artist).permit(
    	:name,
    	:description
    )
  end	

end
