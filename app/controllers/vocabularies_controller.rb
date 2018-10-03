class VocabulariesController < ApplicationController
	before_action :login_check, only: [:new]
	before_action :myring_present_check, only: [:new]
	before_action :user_check_by_ring, only: [:create]

	#-----------------------get-----------------------
	def index
		@vocabularies = Vocabulary.active.includes(ring: :user).order("created_at DESC").page(params[:page]).per(20)
	end

	def new
		@myrings = current_user.rings.active
	end

	def edit
		@vocabulary = Vocabulary.find(id_params)
		@redirect_flg = params[:redirect_flg]
		@vocabulary_page = params[:vocabulary_page]
	end

	def edit_pin
	end

	#-----------------------post, put-----------------------
	def create
		# 単語作成
		ring_id = ring_id_params
		vocabulary_params.each do |key,value|
			if value[:ja].present? && value[:ch].present?
				pinyin = get_pinyin(value[:ch])
				Vocabulary.create("ja"=>value[:ja], "ch"=>value[:ch], "pin"=>pinyin, "ring_id"=> ring_id)
			end
		end

		#リダイレクト
		redirect_to ring_vocabulary_ja_path(ring_id)
	end

	def update
		vocabulary = Vocabulary.find(id_params)
		vocabulary.update("ja"=>update_params[:ja], "ch"=>update_params[:ch], "pin"=>update_params[:pin])

		#リダイレクト
		ring = vocabulary.ring

		if params[:vocabulary][:redirect_flg] == "vocabulary_ja"
			redirect_to ring_vocabulary_ja_path(ring, page: params[:vocabulary][:vocabulary_page])
		elsif params[:vocabulary][:redirect_flg] == "vocabulary_ch"
			redirect_to ring_vocabulary_ch_path(ring, page: params[:vocabulary][:vocabulary_page])
		elsif params[:vocabulary][:redirect_flg] == "vocabulary_pin"
			redirect_to ring_vocabulary_pin_path(ring, page: params[:vocabulary][:vocabulary_page])
		else
			redirect_to vocabularies_path
		end
	end

	def destroy
	end

	def copy
		vocabulary = Vocabulary.find(vocabulary_id_params)
		new_vocabulary = Vocabulary.create(ring_id: ring_id_params, ja: vocabulary.ja, ch: vocabulary.ch, pin: vocabulary.pin)
	end

	def check_ja
		@vocabulary = Vocabulary.find(vocabulary_id_params)
		@vocabulary.update(memorized_ja: 1)

		#ページ遷移kaminariコントロール用クエリ
		@vocabulary_page = request.query_string.delete("page=").to_i
	end

	def check_ch
		@vocabulary = Vocabulary.find(vocabulary_id_params)
		@vocabulary.update(memorized_ch: 1)

		#ページ遷移kaminariコントロール用クエリ
		@vocabulary_page = request.query_string.delete("page=").to_i
	end

	def check_pin
		@vocabulary = Vocabulary.find(vocabulary_id_params)
		@vocabulary.update(memorized_pin: 1)

		#ページ遷移kaminariコントロール用クエリ
		@vocabulary_page = request.query_string.delete("page=").to_i
	end

	def uncheck_ja
		@vocabulary = Vocabulary.find(vocabulary_id_params)
		@vocabulary.update(memorized_ja: 0)

		#ページ遷移kaminariコントロール用クエリ
		@vocabulary_page = request.query_string.delete("page=").to_i
	end

	def uncheck_ch
		@vocabulary = Vocabulary.find(vocabulary_id_params)
		@vocabulary.update(memorized_ch: 0)

		#ページ遷移kaminariコントロール用クエリ
		@vocabulary_page = request.query_string.delete("page=").to_i
	end

	def uncheck_pin
		@vocabulary = Vocabulary.find(vocabulary_id_params)
		@vocabulary.update(memorized_pin: 0)

		#ページ遷移kaminariコントロール用クエリ
		@vocabulary_page = request.query_string.delete("page=").to_i
	end

	def update_pin
	end


	private
	#-----------------------ストロングパラメーター-----------------------
	def update_params
		pinyin = get_pinyin(params[:vocabulary][:ch])
		params.require(:vocabulary).permit(:ja, :ch).merge(pin: pinyin)
	end



	#-----------------------validation系-----------------------


end
