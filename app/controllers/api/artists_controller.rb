module API
	class ArtistsController < ApplicationController

		def index
			respond_with artists
		end

		def show
			respond_with artist
		end

		def create
			author = { author_id: current_user.id }
	    @artist = Artist.create(artist_params.merge(author))
	    respond_with artist, location: api_artists_url(artist)
		end

		def update
	    artist.update(artist_params)
	    respond_with artist, location: api_artists_url(artist)
		end

		def destroy
			artist.destroy
	    respond_with artist, location: api_artists_url
		end

		protected
		def artists
			@artists ||= Artist.all.includes(:releases)
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
end
