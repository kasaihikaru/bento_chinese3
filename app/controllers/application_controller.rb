class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :introduction, :link])
  end



	#-----------------------文字用加工系-----------------------
	def get_pinyin(ch)
		pin = PinYin.of_string(ch, :unicode)
		if pin.count == 1
			pinyin = pin.first
		else
			pinyin = ""
			pin.each do |p|
				pinyin += "#{p} "
			end
		end
		return pinyin
	end



	#-----------------------リダイレクト-----------------------
	def redirect_with_sentence_flg_and_sentence_page(sentence)
		book = sentence.book
		if params[:redirect_flg] == "sentence_ja"
			redirect_to book_sentence_ja_path(book, page: params[:sentence_page])
		elsif params[:redirect_flg] == "sentence_ch"
			redirect_to book_sentence_ch_path(book, page: params[:sentence_page])
		elsif params[:redirect_flg] == "sentence_pin"
			redirect_to book_sentence_pin_path(book, page: params[:sentence_page])
		else
			redirect_to sentences_path
		end
	end


	def redirect_with_sentence_flg_and_sentence_page_get_by_sentence(sentence)
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


	def redirect_with_word_flg(word)
		book = word.sentence.book
		if params[:redirect_flg] == "word_ja"
			redirect_to book_word_ja_path(book)
		elsif params[:redirect_flg] == "word_ch"
			redirect_to book_word_ch_path(book)
		elsif params[:redirect_flg] == "word_pin"
			redirect_to book_word_pin_path(book)
		else
			redirect_to sentences_path
		end
	end


	def redirect_with_vocabulary_flg_and_vocabulary_page(vocabulary)
		ring = vocabulary.ring
		if params[:redirect_flg] == "vocabulary_ja"
			redirect_to ring_vocabulary_ja_path(ring, page: params[:vocabulary_page])
		elsif params[:redirect_flg] == "vocabulary_ch"
			redirect_to ring_vocabulary_ch_path(ring, page: params[:vocabulary_page])
		elsif params[:redirect_flg] == "vocabulary_pin"
			redirect_to ring_vocabulary_pin_path(ring, page: params[:vocabulary_page])
		else
			redirect_to vocabularies_path
		end
	end

	def redirect_with_vocabulary_flg_and_vocabulary_page_get_by_vocabulary(vocabulary)
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


	private
	#-----------------------ユーザーvalidation系-----------------------
	def login_check
		unless user_signed_in?
			flash[:alert] = "ログインしてください"
			redirect_to root_path
		end
	end

	def user_check_by_id
		unless user_signed_in? && params[:id].to_i == current_user.id
			flash[:alert] = "ログインしてください"
			redirect_to root_path
		end
	end

	def user_check_by_ring
		unless user_signed_in? && Ring.find(ring_id_params).user_id == current_user.id
			flash[:alert] = "ログインしてください"
			redirect_to root_path
		end
	end


	#-----------------------初期利用系validation-----------------------
	def mybook_present_check
		unless current_user.books.active.present?
			redirect_to new_book_path
		end
	end

	def myring_present_check
		unless current_user.rings.active.present?
			redirect_to new_ring_path
		end
	end


	#-----------------------strong patameter-----------------------
	def id_params
		params[:id].to_i
	end

	def book_id_params
		params[:book_id].to_i
	end

	def ring_id_params
		params[:ring_id].to_i
	end

	def sentence_id_params
		params[:sentence_id].to_i
	end

	def sentence_book_id_params
		params[:sentence][:book_id].to_i
	end

	def word_id_params
		params[:word_id].to_i
	end

	def words_attribute_params(sentence_id)
		array = []

		words = params[:sentence][:words_attributes]
		if words.present?
			words.each do |key,value|
				if value["ja"].present? && value["ch"].present?
						value[:sentence_id] = sentence_id

					pin = PinYin.of_string(value[:ch], :unicode)
					if pin.count == 1
						pinyin = pin.first
					else
						pinyin = ""
						pin.each do |p|
							pinyin += "#{p} "
						end
					end
					value[:pin] = pinyin

					array << value
				else
					next
				end
			end
		end
		return array
	end

	def vocabulary_params
		params[:vocabulary]
	end

	def vocabulary_id_params
		params[:vocabulary_id].to_i
	end


	def pin_params
		params[:pin]
	end

	def words_params
		params[:words]
	end

	def serch_ja_params
		params[:search_ja]
	end

	def serach_ch_params
		params[:search_ch]
	end

	def page_params
		params[:page]
	end
end
