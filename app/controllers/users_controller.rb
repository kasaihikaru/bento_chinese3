class UsersController < ApplicationController
	#-----------------------get-----------------------
	def show
		@user = User.find(params[:id])
		@books = @user.books.active
		@rings = @user.rings.active

		@book = Book.new
		@ring = Ring.new
	end

	#-----------------------post, put-----------------------
	def update
	end

	def destroy
	end

	#-----------------------ストロングパラメーター-----------------------




	#-----------------------validation系-----------------------

end
