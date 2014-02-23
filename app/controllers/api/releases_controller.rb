module API	
	class ReleasesController < ApplicationController
		
		def index
			respond_with releases
		end

		def show
			respond_with release
		end

		def create
	    @release = Release.create(release_params)
	    respond_with release, location: api_releases_url(release)
		end

		def update
	    release.update(release_params)
	    respond_with release, location: api_releases_url(release)
		end

	  def destroy
	    release.destroy
	    respond_with release, location: api_releases_url
	  end

		private
		def releases
			@releases ||= Release.all.includes(:expenses)
		end

		def release
			@release ||= Release.find(params[:id])
		end

	  def release_params
	    params.require(:release).permit(
	    	:artist_id,
	    	:catalogue_number,
	      :name
	    )
	  end	

	end
end
