// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// bootstrap-sprocketsは、jqueryの後に追加しないとだめ。
//= require jquery
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .






$(document).on('turbolinks:load',function() {


//--------------- 単語抜き出し -------------------
	$('#auto-words').on('click', function() {

		var sentence = $('#sentence-ch').val();
		console.log(sentence);
		var words = sentence.split("");

		var array = $.grep(words, function(e){return e !== "."
				&& e !== "-"
				&& e !== ","
				&& e !== "1"
				&& e !== "2"
				&& e !== "3"
				&& e !== "4"
				&& e !== "5"
				&& e !== "6"
				&& e !== "7"
				&& e !== "8"
				&& e !== "9"
				&& e !== "0"
				&& e !== "/"
				&& e !== "|"
				&& e !== "&"
				&& e !== "%"
				&& e !== "$"
				&& e !== "。"
				&& e !== "，"
				&& e !== "！"
				&& e !== "１"
				&& e !== "２"
				&& e !== "３"
				&& e !== "４"
				&& e !== "５"
				&& e !== "６"
				&& e !== "７"
				&& e !== "８"
				&& e !== "９"
				&& e !== "０"
				&& e !== "？"
				&& e !== " "
				&& e !== "　"
				&& e !== "a"
				&& e !== "b"
				&& e !== "c"
				&& e !== "d"
				&& e !== "e"
				&& e !== "f"
				&& e !== "g"
				&& e !== "h"
				&& e !== "i"
				&& e !== "j"
				&& e !== "k"
				&& e !== "l"
				&& e !== "m"
				&& e !== "n"
				&& e !== "o"
				&& e !== "p"
				&& e !== "q"
				&& e !== "r"
				&& e !== "s"
				&& e !== "t"
				&& e !== "u"
				&& e !== "v"
				&& e !== "x"
				&& e !== "y"
				&& e !== "z"
		;});

		$.each(array,function(i,word){
			var target = '#sentence_words_attributes_' +i+ '_ch';
			$(target).val(word);
		});
	});


//--------------- google 検索ボタン sentence_new -------------------
	// 短文
	$("#sentence_new_ja_btn").click(function(){

		var target = '#sentence_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#sentence_new_ch_btn").click(function(){

		var target = '#sentence-ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});




	// 単語
	$("#word_ja_0").click(function(){

		var target = '#sentence_words_attributes_0_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_0").click(function(){

		var target = '#sentence_words_attributes_0_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_1").click(function(){

		var target = '#sentence_words_attributes_1_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_1").click(function(){

		var target = '#sentence_words_attributes_1_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_2").click(function(){

		var target = '#sentence_words_attributes_2_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_2").click(function(){

		var target = '#sentence_words_attributes_2_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_3").click(function(){

		var target = '#sentence_words_attributes_3_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_3").click(function(){

		var target = '#sentence_words_attributes_3_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_4").click(function(){

		var target = '#sentence_words_attributes_4_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_4").click(function(){

		var target = '#sentence_words_attributes_4_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_5").click(function(){

		var target = '#sentence_words_attributes_5_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_5").click(function(){

		var target = '#sentence_words_attributes_5_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_6").click(function(){

		var target = '#sentence_words_attributes_6_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_6").click(function(){

		var target = '#sentence_words_attributes_6_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_7").click(function(){

		var target = '#sentence_words_attributes_7_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_7").click(function(){

		var target = '#sentence_words_attributes_7_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_8").click(function(){

		var target = '#sentence_words_attributes_8_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_8").click(function(){

		var target = '#sentence_words_attributes_8_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_9").click(function(){

		var target = '#sentence_words_attributes_9_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_9").click(function(){

		var target = '#sentence_words_attributes_9_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_10").click(function(){

		var target = '#sentence_words_attributes_10_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_10").click(function(){

		var target = '#sentence_words_attributes_10_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_11").click(function(){

		var target = '#sentence_words_attributes_11_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_11").click(function(){

		var target = '#sentence_words_attributes_11_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_12").click(function(){

		var target = '#sentence_words_attributes_12_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_12").click(function(){

		var target = '#sentence_words_attributes_12_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_13").click(function(){

		var target = '#sentence_words_attributes_13_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_13").click(function(){

		var target = '#sentence_words_attributes_13_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_14").click(function(){

		var target = '#sentence_words_attributes_14_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_14").click(function(){

		var target = '#sentence_words_attributes_14_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_15").click(function(){

		var target = '#sentence_words_attributes_15_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_15").click(function(){

		var target = '#sentence_words_attributes_15_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_16").click(function(){

		var target = '#sentence_words_attributes_16_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_16").click(function(){

		var target = '#sentence_words_attributes_16_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_17").click(function(){

		var target = '#sentence_words_attributes_17_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_17").click(function(){

		var target = '#sentence_words_attributes_17_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_18").click(function(){

		var target = '#sentence_words_attributes_18_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_18").click(function(){

		var target = '#sentence_words_attributes_18_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_19").click(function(){

		var target = '#sentence_words_attributes_19_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_19").click(function(){

		var target = '#sentence_words_attributes_19_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ja_20").click(function(){

		var target = '#sentence_words_attributes_20_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_ch_20").click(function(){

		var target = '#sentence_words_attributes_20_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});



//--------------- google 検索ボタン sentence_edit -------------------
	// 短文
	$("#sentence_edit_ja_btn").click(function(){

		var target = '#sentence_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#sentence_edit_ch_btn").click(function(){

		var target = '#sentence-ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});


	// 単語
	$("#word_add_ja_0").click(function(){

		var target = '#word_add_input_ja_0';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ch_0").click(function(){

		var target = '#word_add_input_ch_0';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ja_1").click(function(){

		var target = '#word_add_input_ja_1';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ch_1").click(function(){

		var target = '#word_add_input_ch_1';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ja_2").click(function(){

		var target = '#word_add_input_ja_2';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ch_2").click(function(){

		var target = '#word_add_input_ch_2';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ja_3").click(function(){

		var target = '#word_add_input_ja_3';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ch_3").click(function(){

		var target = '#word_add_input_ch_3';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ja_4").click(function(){

		var target = '#word_add_input_ja_4';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ch_4").click(function(){

		var target = '#word_add_input_ch_4';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ja_5").click(function(){

		var target = '#word_add_input_ja_5';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ch_5").click(function(){

		var target = '#word_add_input_ch_5';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ja_6").click(function(){

		var target = '#word_add_input_ja_6';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ch_6").click(function(){

		var target = '#word_add_input_ch_6';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ja_7").click(function(){

		var target = '#word_add_input_ja_7';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ch_7").click(function(){

		var target = '#word_add_input_ch_7';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ja_8").click(function(){

		var target = '#word_add_input_ja_8';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ch_8").click(function(){

		var target = '#word_add_input_ch_8';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ja_9").click(function(){

		var target = '#word_add_input_ja_9';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ch_9").click(function(){

		var target = '#word_add_input_ch_9';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ja_10").click(function(){

		var target = '#word_add_input_ja_10';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_add_ch_10").click(function(){

		var target = '#word_add_input_ch_10';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});



//--------------- google 検索ボタン word_edit -------------------
	$("#word_edit_ja").click(function(){

		var target = '#word_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_edit_ch").click(function(){

		var target = '#word_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});




//--------------- google 検索ボタン vocabulary_new -------------------
	$("#vocabulary_ja_1").click(function(){

		var target = '#vocabulary_1_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#vocabulary_ch_1").click(function(){

		var target = '#vocabulary_1_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#vocabulary_ja_2").click(function(){

		var target = '#vocabulary_2_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#vocabulary_ch_2").click(function(){

		var target = '#vocabulary_2_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#vocabulary_ja_3").click(function(){

		var target = '#vocabulary_3_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#vocabulary_ch_3").click(function(){

		var target = '#vocabulary_3_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});

	$("#vocabulary_ja_4").click(function(){

		var target = '#vocabulary_4_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#vocabulary_ch_4").click(function(){

		var target = '#vocabulary_4_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#vocabulary_ja_5").click(function(){

		var target = '#vocabulary_5_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#vocabulary_ch_5").click(function(){

		var target = '#vocabulary_5_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});




//--------------- google 検索ボタン vocabulary_edit -------------------
	$("#vocabulary_edit_ja").click(function(){

		var target = '#vocabulary_ja';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#vocabulary_edit_ch").click(function(){

		var target = '#vocabulary_ch';
				word = $(target).val();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});



//--------------- google 検索ボタン sentence_pinedit -------------------
	// 短文
	$("#sentence_pinedit_ch_btn").click(function(){

		var target = '#sentence_pinedit_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});

	// 単語
	$("#word_pinedit_ch_1").click(function(){

		var target = '#sentence_words_pinedit_1_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_pinedit_ch_2").click(function(){

		var target = '#sentence_words_pinedit_2_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_pinedit_ch_3").click(function(){

		var target = '#sentence_words_pinedit_3_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_pinedit_ch_4").click(function(){

		var target = '#sentence_words_pinedit_4_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_pinedit_ch_5").click(function(){

		var target = '#sentence_words_pinedit_5_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_pinedit_ch_6").click(function(){

		var target = '#sentence_words_pinedit_6_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_pinedit_ch_7").click(function(){

		var target = '#sentence_words_pinedit_7_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_pinedit_ch_8").click(function(){

		var target = '#sentence_words_pinedit_8_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_pinedit_ch_9").click(function(){

		var target = '#sentence_words_pinedit_9_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});
	$("#word_pinedit_ch_10").click(function(){

		var target = '#sentence_words_pinedit_10_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});



//--------------- google 検索ボタン word_pinedit -------------------
	$("#word_pinedit_ch").click(function(){

		var target = '#sentence_word_pinedit_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});


//--------------- google 検索ボタン vocabulary_pinedit -------------------
	$("#vocabulary_pinedit_ch_btn").click(function(){

		var target = '#vocabulary_pinedit_ch';
				word = $(target).text();

		window.open('http://www.google.com/search?q=中国語%20'+word);
	});



});