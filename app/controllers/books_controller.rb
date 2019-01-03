class BooksController < ApplicationController
	before_action :login_check, only: [:create, :copy]


	#-----------------------common-----------------------
	def get_counts
		@count_sentence_ja_unmemorized = @current_book.sentences.active.unmemorized_ja.count
		@count_sentence_ch_unmemorized = @current_book.sentences.active.unmemorized_ch.count
		@count_sentence_pin_unmemorized = @current_book.sentences.active.unmemorized_pin.count
		@count_word_ja_unmemorized = 0
		@count_word_ch_unmemorized = 0
		@count_word_pin_unmemorized = 0
		@current_book.sentences.each do |sentence|
			@count_word_ja_unmemorized += sentence.words.active.unmemorized_ja.count
			@count_word_ch_unmemorized += sentence.words.active.unmemorized_ch.count
			@count_word_pin_unmemorized += sentence.words.active.unmemorized_pin.count
		end
	end

	def get_book_sentences_pagenate
		@current_book = Book.find(book_id_params)
		@sentences = @current_book.sentences.active.includes(:words, book: :user).page(page_params).per(10)
	end

	def get_book_sentences
		@current_book = Book.find(book_id_params)
		@sentences = @current_book.sentences.active.includes(:words, book: :user)
	end

	#ページ遷移kaminariコントロール用クエリ
	def control_kaminari
		@sentence_page = request.query_string.delete("page=").to_i
	end


	#-----------------------get-----------------------
	def sentence_ja
		get_book_sentences_pagenate
		get_counts

		control_kaminari
	end

	def sentence_ch
		get_book_sentences_pagenate
		get_counts

		control_kaminari
	end

	def sentence_pin
		get_book_sentences_pagenate
		get_counts

		control_kaminari
	end

	def word_ja
		get_book_sentences
		get_counts
	end

	def word_ch
		get_book_sentences
		get_counts
	end

	def word_pin
		get_book_sentences
		get_counts
	end

	def new
		@book = Book.new
	end

	def edit
	end

	def sentence_list_ch
		get_book_sentences
		get_counts
	end


	#-----------------------post, put-----------------------
	def create
		Book.create(create_params)
		if params[:book][:redirect_flg] == "first_book"
			redirect_to new_sentence_path
		else
			redirect_to user_path(current_user)
		end
	end

	def update
		@book = Book.find(id_params)
		@book.update(name: params[:book][:name])

		if params[:book][:redirect_flg] == "sentence_ja"
			redirect_to book_sentence_ja_path(@book)
		elsif params[:book][:redirect_flg] == "sentence_ch"
			redirect_to book_sentence_ch_path(@book)
		elsif params[:book][:redirect_flg] == "sentence_pin"
			redirect_to book_sentence_pin_path(@book)
		elsif params[:book][:redirect_flg] == "word_ja"
			redirect_to book_word_ja_path(@book)
		elsif params[:book][:redirect_flg] == "word_ch"
			redirect_to book_word_ch_path(@book)
		elsif params[:book][:redirect_flg] == "word_pin"
			redirect_to book_word_pin_path(@book)
		elsif params[:book][:redirect_flg] == "sentence_ch_list"
			redirect_to book_sentence_list_ch_path(@book)
		else
			redirect_to user_path(current_user)
		end
	end

	def destroy
	end


	def copy
		book = Book.find(book_id_params)
		new_book = Book.create(user_id: current_user.id, name: params[:book_name])
		book.sentences.each do |sentence|
			new_sentence = Sentence.create(book_id: new_book.id, ja: sentence.ja, ch: sentence.ch, pin: sentence.pin)
			sentence.words.each do |word|
				Word.create(sentence_id: new_sentence.id, ja: word.ja, ch: word.ch, pin: word.pin)
			end
		end
	end


	def uncheck_all_sentences_ja
		@book = Book.find(book_id_params)
		@book.sentences.each do |sentence|
			sentence.update( memorized_ja: 0)
		end

		redirect_to book_sentence_ja_path(@book)
	end

	def uncheck_all_sentences_ch
		@book = Book.find(book_id_params)
		@book.sentences.each do |sentence|
			sentence.update( memorized_ch: 0)
		end

		redirect_to book_sentence_ch_path(@book)
	end

	def uncheck_all_sentences_pin
		@book = Book.find(book_id_params)
		@book.sentences.each do |sentence|
			sentence.update( memorized_pin: 0)
		end

		redirect_to book_sentence_pin_path(@book)
	end

	def uncheck_all_words_ja
		@book = Book.find(book_id_params)

		@book.sentences.each do |sentence|
			sentence.words.each do |word|
				word.update( memorized_ja: 0)
			end
		end

		redirect_to book_word_ja_path(@book)
	end

	def uncheck_all_words_ch
		@book = Book.find(book_id_params)

		@book.sentences.each do |sentence|
			sentence.words.each do |word|
				word.update( memorized_ch: 0)
			end
		end

		redirect_to book_word_ch_path(@book)
	end

	def uncheck_all_words_pin
		@book = Book.find(book_id_params)

		@book.sentences.each do |sentence|
			sentence.words.each do |word|
				word.update( memorized_pin: 0)
			end
		end

		redirect_to book_word_pin_path(@book)
	end



	#-----------------------ストロングパラメーター-----------------------
	def create_params
		params.require(:book).permit(:name).merge(user_id: current_user.id)
	end



	#-----------------------validation系-----------------------


end
