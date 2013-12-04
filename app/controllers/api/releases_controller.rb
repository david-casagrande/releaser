class Api::ReleasesController < ApplicationController
	
	respond_to :json

	def index
		respond_with releases
	end

	def show
		respond_with release
	end

	private
	def releases
		@releases ||= Release.all
	end

	def release
		@release ||= Release.find(params[:id])
	end

end
