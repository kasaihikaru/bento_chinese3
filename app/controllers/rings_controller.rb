class RingsController < ApplicationController

	#-----------------------get-----------------------
	def vocabulary_ja
		@current_ring = Ring.find(ring_id_params)
		@vocabularies = @current_ring.vocabularies.active.includes(ring: :user).page(params[:page]).per(30)
	end

	def vocabulary_ch
		@current_ring = Ring.find(ring_id_params)
		@vocabularies = @current_ring.vocabularies.active.includes(ring: :user).page(params[:page]).per(30)
	end

	def vocabulary_pin
		@current_ring = Ring.find(ring_id_params)
		@vocabularies = @current_ring.vocabularies.active.includes(ring: :user).page(params[:page]).per(30)
	end

	def new
		@ring = Ring.new
	end

	def edit
	end

	#-----------------------post, put-----------------------
	def create
		Ring.create(create_params)
		redirect_to user_path(current_user)
	end

	def update
	end

	def destroy
	end


	def copy
	end


	def uncheck_all_vocabularies_ja
		ring = Ring.find(ring_id_params)
		ring.vocabularies.each do |vocabulary|
			vocabulary.update(memorized_ja: 0)
		end

		redirect_to ring_vocabulary_ja_path(ring)
	end

	def uncheck_all_vocabularies_ch
		ring = Ring.find(ring_id_params)
		ring.vocabularies.each do |vocabulary|
			vocabulary.update(memorized_ch: 0)
		end

		redirect_to ring_vocabulary_ch_path(ring)
	end

	def uncheck_all_vocabularies_pin
		ring = Ring.find(ring_id_params)
		ring.vocabularies.each do |vocabulary|
			vocabulary.update(memorized_pin: 0)
		end

		redirect_to ring_vocabulary_pin_path(ring)
	end

	#-----------------------ストロングパラメーター-----------------------
	def create_params
		params.require(:ring).permit(:name).merge(user_id: current_user.id)
	end



	#-----------------------validation系-----------------------


end