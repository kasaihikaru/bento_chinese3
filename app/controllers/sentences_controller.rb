class SentencesController < ApplicationController
	before_action :login_check, only: [:new, :copy]
	before_action :mybook_present_check, only: [:new]


	#-----------------------get-----------------------
	def index
		@sentences = Sentence.active.includes(book: :user).order("created_at DESC").page(params[:page]).per(20)
	end

	def new
		@mybooks = current_user.books.active
		@sentence = Sentence.new
		@sentence.words.build
	end

	def edit
		@sentence = Sentence.find(id_params)
		@sentence.words.build

		@redirect_flg = params[:redirect_flg]
		@sentence_page = params[:sentence_page]
	end

	def edit_pin
	end

	#-----------------------post, put-----------------------
	def create
		# 短文作成
		Sentence.create(create_sentence_params)

		# 付属の単語作成
		words = words_attribute_params(Sentence.last.id)
		words.each do |w|
			Word.create("ja"=>w[:ja], "ch"=>w[:ch], "pin"=>w[:pin], "sentence_id"=>w[:sentence_id])
		end

		#リダイレクト
		redirect_to book_sentence_ja_path(params[:sentence][:book_id].to_i)
	end

	def update
		sentence = Sentence.find(id_params)
		sentence.update(ja:update_sentence_params[:ja], ch:update_sentence_params[:ch], pin:update_sentence_params[:pin] )

		# 付属の単語作成
		words = words_attribute_params(Sentence.last.id)
		words.each do |w|
			if w[:id].present?
				original_word = Word.find(w[:id])
				original_word.update(ja: w[:ja], ch: w[:ch], pin: w[:pin])
			else
				Word.create(ja: w[:ja], ch: w[:ch], pin: w[:pin], sentence_id: sentence.id)
			end
		end

		# 新規word追加
		update_new_words_params.each do |w|
			if w[:ja].present? && w[:ch].present?
				get_pinyin(w[:ch])
				Word.create(ja: w[:ja], ch: w[:ch], sentence_id: original_sentence.id, pin: pinyin)
			end
		end


		#リダイレクト
		book = sentence.book
		if params[:sentence][:redirect_flg] == "sentence_ja"
			redirect_to book_sentence_ja_path(book, page: params[:sentence][:sentence_page])
		elsif params[:sentence][:redirect_flg] == "sentence_ch"
			redirect_to book_sentence_ch_path(book, page: params[:sentence][:sentence_page])
		elsif params[:sentence][:redirect_flg] == "sentence_pin"
			redirect_to book_sentence_pin_path(book, page: params[:sentence][:sentence_page])
		else
			redirect_to sentences_path
		end
	end

	def destroy
	end

	def copy
		sentence = Sentence.find(sentence_id_params)
		new_sentence = Sentence.create(book_id: book_id_params, ja: sentence.ja, ch: sentence.ch, pin: sentence.pin)
		sentence.words.each do |word|
			Word.create(sentence_id: new_sentence.id, ja: word.ja, ch: word.ch, pin: word.pin)
		end
	end

	def check_ja
		@sentence = Sentence.find(sentence_id_params)
		@sentence.update( memorized_ja: 1 )
	end

	def check_ch
		@sentence = Sentence.find(sentence_id_params)
		@sentence.update( memorized_ch: 1 )
	end

	def check_pin
		@sentence = Sentence.find(sentence_id_params)
		@sentence.update( memorized_pin: 1 )
	end

	def update_pin
	end

	private
	#-----------------------ストロングパラメーター-----------------------
	def create_sentence_params
		pinyin = get_pinyin(params[:sentence][:ch])
		params.require(:sentence).permit(:book_id, :ja, :ch).merge(pin: pinyin)
	end

	def update_sentence_params
		pinyin = get_pinyin(params[:sentence][:ch])
		params.require(:sentence).permit(:ja, :ch).merge(pin: pinyin)
	end

	def update_new_words_params
		params.require(:new_words)
	end




	#-----------------------validation系-----------------------

end
