class PagesController < ApplicationController
	def show
    	@user = User.find(params[:id])
  	end

  	def home
  		@posts = Post.all
 	end

end