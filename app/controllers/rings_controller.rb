class RingsController < ApplicationController

	#-----------------------get-----------------------
	def vocabulary_ja
		@current_ring = Ring.find(ring_id_params)
		@vocabularies = @current_ring.vocabularies.active.includes(ring: :user).page(page_params).per(30)

		#ページ遷移kaminariコントロール用クエリ
		@vocabulary_page = request.query_string.delete("page=").to_i
	end

	def vocabulary_ch
		@current_ring = Ring.find(ring_id_params)
		@vocabularies = @current_ring.vocabularies.active.includes(ring: :user).page(page_params).per(30)

		#ページ遷移kaminariコントロール用クエリ
		@vocabulary_page = request.query_string.delete("page=").to_i
	end

	def vocabulary_pin
		@current_ring = Ring.find(ring_id_params)
		@vocabularies = @current_ring.vocabularies.active.includes(ring: :user).page(page_params).per(30)

		#ページ遷移kaminariコントロール用クエリ
		@vocabulary_page = request.query_string.delete("page=").to_i
	end

	def new
		@ring = Ring.new
	end

	def edit
	end

	#-----------------------post, put-----------------------
	def create
		Ring.create(create_params)

		if params[:ring][:redirect_flg] == "first_ring"
			redirect_to new_sentence_path
		else
			redirect_to user_path(current_user)
		end
	end

	def update
		@ring = Ring.find(id_params)
		@ring.update(name: params[:ring][:name])

		if params[:ring][:redirect_flg] == "vocabulary_ja"
			redirect_to ring_vocabulary_ja_path(@ring)
		elsif params[:ring][:redirect_flg] == "vocabulary_ch"
			redirect_to ring_vocabulary_ch_path(@ring)
		elsif params[:ring][:redirect_flg] == "vocabulary_pin"
			redirect_to ring_vocabulary_pin_path(@ring)
		else
			redirect_to user_path(current_user)
		end
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