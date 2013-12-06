class Api::ArtistsController < ApplicationController

	def index
		respond_with artists
	end

	def show
		respond_with artist
	end

	private
	def artists
		@artists ||= Artist.all
	end

	def artist
		@artist ||= Artist.find(params[:id])
	end

end
