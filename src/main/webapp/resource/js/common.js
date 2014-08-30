// 所有模块都通过 define 来定义
define(function(require, exports, module) {

	// 通过 require 引入依赖
	require('jquery');
	require('jquery-ui');
	require('juqery-ui_touch');
	require('bootstrap');
	require('bootstra-select');
	require('jquery-tagsinput');
	require('jquery-placeholder');
	
	var $=jQuery;
	var flag = $('body').attr('flag');
	$('li[flag="' + flag + '"]').addClass('active');
});