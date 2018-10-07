Rails.application.routes.draw do
  devise_for :users, :controllers => {
      registrations: "users/registrations",
      confirmations: "users/confirmations",
      sessions: "users/sessions",
      passwords: "users/passwords"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "sentences#index"

  resources :users, only: [:show, :update, :destroy]

  resources :books, only: [:new, :edit, :create, :update, :destroy] do
      #get
    get 'sentence_ja' #短文帳を勉強のために閲覧（日本語）
    get 'sentence_ch' #短文帳を勉強のために閲覧（中国語）
    get 'sentence_pin' #短文帳を勉強のために閲覧（ピンイン）
    get 'word_ja' #単語帳を勉強のために閲覧（日本語）
    get 'word_ch' #単語帳を勉強のために閲覧（中国語）
    get 'word_pin' #単語帳を勉強のために閲覧（ピンイン）

    #post, put
    post 'copy' #短文帳コピー
    put 'uncheck_all_sentences_ja' #短文覚えたチェック全部取り消し（日本語）
    put 'uncheck_all_sentences_ch' #短文覚えたチェック全部取り消し（中国語）
    put 'uncheck_all_sentences_pin' #短文覚えたチェック全部取り消し（ピンイン）
    put 'uncheck_all_words_ja' #単語覚えたチェック全部取り消し（日本語）
    put 'uncheck_all_words_ch' #単語覚えたチェック全部取り消し（中国語）
    put 'uncheck_all_words_pin' #単語覚えたチェック全部取り消し（ピンイン）
  end

  resources :sentences, only: [:index, :new, :edit, :create, :update, :destroy] do
    #get
    get 'edit_pin' #ピンイン編集ページ

    #post, put
    post 'copy' #短文コピー
    put 'check_ja' #覚えたチェック
    put 'check_ch' #覚えたチェック
    put 'check_pin' #覚えたチェック
    put 'update_pin' #ピンインを更新
  end

  resources :words, only: [:edit, :create, :update, :destroy] do
    #get
    get 'edit_pin' #ピンイン編集ページ

    #post, put
    put 'check_ja' #覚えたチェック
    put 'check_ch' #覚えたチェック
    put 'check_pin' #覚えたチェック
    put 'uncheck_ja' #覚えたチェック取り消し
    put 'uncheck_ch' #覚えたチェック取り消し
    put 'uncheck_pin' #覚えたチェック取り消し
    put 'update_pin' #ピンインを更新
  end


  resources :rings, only: [:new, :edit, :create, :update, :destroy] do
    #get
    get 'vocabulary_ja' #単語帳を勉強のために閲覧（日本語）
    get 'vocabulary_ch' #単語帳を勉強のために閲覧（中国語）
    get 'vocabulary_pin' #単語帳を勉強のために閲覧（ピンイン）

    #post, put
    post 'copy' #単語帳コピー
    put 'uncheck_all_vocabularies_ja' #単語覚えたチェック全部取り消し（日本語）
    put 'uncheck_all_vocabularies_ch' #単語覚えたチェック全部取り消し（中国語）
    put 'uncheck_all_vocabularies_pin' #単語覚えたチェック全部取り消し（ピンイン）
  end

  resources :vocabularies, only: [:index, :new, :edit, :create, :update, :destroy] do
    #get
    get 'edit_pin' #ピンイン編集ページ

    #post, put
    post 'copy' #単語コピー
    put 'check_ja' #覚えたチェック
    put 'check_ch' #覚えたチェック
    put 'check_pin' #覚えたチェック
    put 'uncheck_ja' #覚えたチェック取り消し
    put 'uncheck_ch' #覚えたチェック取り消し
    put 'uncheck_pin' #覚えたチェック取り消し
    put 'update_pin' #ピンインを更新
  end

end
