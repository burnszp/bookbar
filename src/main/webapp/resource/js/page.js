// 所有模块都通过 define 来定义
define(function(require, exports, module) {
  
 	function Page(pageSize,pageNumber,pageCount) {
 		
 		var me = this;
		this.container = $('#page');
		this.pageSize = (Number)(pageSize);
		this.pageNumber =(Number)(pageNumber);
		this.pageCount = (Number)(pageCount);
 
		var ul = $('<ul></ul>');
		var previousLi = $('<li class="previous"><a href="#" class="fui-arrow-left"></a></li>');
		var nextLi = $('<li class="next"><a href="#" class="fui-arrow-right"></a></li>');
		previousLi.appendTo(ul);
		var begin=Math.max(1,this.pageNumber-10/2);
		var end = Math.min(begin+10,this.pageCount);
		console.log('begin:'+begin+' end:'+end);
		for(var i=begin;i<=end;i++){
			if(this.pageNumber==i){
				$('<li class="active"> <a href="#">'+i+'</a></li>').appendTo(ul);
			}else{
				$('<li> <a href="#" class="other">'+i+'</a></li>').appendTo(ul);
			}
		}
		nextLi.appendTo(ul);
		ul.appendTo(this.container);
		$(previousLi.children()[0]).click(function(){
			me.prePage();
			 
		});
		$(nextLi.children()[0]).click(function(){
			me.nextPage();
			 
		});
		$('.other').click(function(){
			me.page($(this).html());
			
		});
	}
 	
 	Page.prototype.prePage=function(){
 		if(this.pageNumber>1){
 	 		 this.page(this.pageNumber-1);	
 		}
 	};
 	Page.prototype.nextPage=function(){
 		if(this.pageNumber<this.pageCount){
 		this.page(this.pageNumber+1);
 		
 		}
 	};
 	Page.prototype.page=function(pageNumber){
 	 	this.pageNumber = pageNumber;
 	 	var url = this.container.attr('url');
 		url+='&ps='+this.pageSize+'&pn='+this.pageNumber;
 		window.location.href=url;
 	 	
 	};
	Page.prototype.getPageSize = function() {
		return this.pageSize;
	};
	Page.prototype.getPageNumber = function() {
		return this.pageNumber;
	};
	module.exports = Page;
});