// 所有模块都通过 define 来定义
define(function(require, exports, module) {
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