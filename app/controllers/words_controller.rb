class WordsController < ApplicationController

	#-----------------------get-----------------------
	def edit
		@word = Word.find(id_params)

		@redirect_flg = params[:redirect_flg]
	end

	def edit_pin
		@word = Word.find(word_id_params)
		@i = 1

		@redirect_flg = params[:redirect_flg]
		@sentence_page = params[:sentence_page]
	end

	#-----------------------post, put-----------------------
	def create
	end

	def update
		word = Word.find(id_params)
		if word.pin_fixed == true
			word.update("ja"=>update_params[:ja], "ch"=>update_params[:ch])
		else
			word.update("ja"=>update_params[:ja], "ch"=>update_params[:ch], "pin"=>update_params[:pin])
		end

		#リダイレクト
		book = word.sentence.book
		if params[:word][:redirect_flg] == "word_ja"
			redirect_to book_word_ja_path(book)
		elsif params[:word][:redirect_flg] == "word_ch"
			redirect_to book_word_ch_path(book)
		elsif params[:word][:redirect_flg] == "word_pin"
			redirect_to book_word_pin_path(book)
		else
			redirect_to sentences_path
		end
	end

	def update_pin
		word = Word.find(word_id_params)
		if word.pin != pin_params
			word.update(pin: pin_params, pin_fixed: 1)
		end

		#リダイレクト
		redirect_with_word_flg(word)
	end

	def destroy
		word = Word.find(id_params)
		word.update(deleted_at: Time.now)

		#リダイレクト
		redirect_with_word_flg(word)
	end

	def copy
	end

	def check_ja
		@word =Word.find(word_id_params)
		@word.update(memorized_ja: 1)
	end

	def check_ch
		@word = Word.find(word_id_params)
		@word.update(memorized_ch: 1)
	end

	def check_pin
		@word = Word.find(word_id_params)
		@word.update(memorized_pin: 1)
	end

	def uncheck_ja
		@word = Word.find(word_id_params)
		@word.update(memorized_ja: 0)
	end

	def uncheck_ch
		@word = Word.find(word_id_params)
		@word.update(memorized_ch: 0)
	end

	def uncheck_pin
		@word = Word.find(word_id_params)
		@word.update(memorized_pin: 0)
	end


	private
	#-----------------------ストロングパラメーター-----------------------
	def update_params
		pinyin = get_pinyin(params[:word][:ch])
		params.require(:word).permit(:ja, :ch).merge(pin: pinyin)
	end



	#-----------------------validation系-----------------------

end