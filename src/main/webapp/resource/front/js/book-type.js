define(function(require, exports, module) {

	require('jquery');
	var $ = jQuery;
	var Page = require('js/page');
	var page = new Page(pageSize,pageNumber,pageCount); 
	console.log(page);
});