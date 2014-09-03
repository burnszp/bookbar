// 所有模块都通过 define 来定义
define(function(require, exports, module) {

	// 通过 require 引入依赖
	require('jquery');
	require('jquery-ui');
	require('juqery-ui_touch');
	require('bootstrap');
	require('bootstrap-select');
	require('jquery-tagsinput');
	require('jquery-placeholder');
	require('typeahead');
	require('application');
	var $ = jQuery;
	var flag = $('body').attr('flag');
	$('li[flag="' + flag + '"]').addClass('active');
	function Tooltip(container) {
		this.container = $('#' + container);
		console.log(this.container);
	}

	Tooltip.prototype.show = function(text) {
		this.container.html(text);
		this.container.show();
	};
	Tooltip.prototype.hide = function() {
		this.container.hide();
	};
	module.exports = Tooltip;
});