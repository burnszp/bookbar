define(function(require, exports, module) {

	require('jquery');
	var Tooltip = require('js/tooltip');
	 
	var $=jQuery;
	
	var Page = require('js/page');
	var page = new Page(pageSize,pageNumber,pageCount); 
	
	var tooltip = new Tooltip('tooltip');
	$('#collectAll').click(function(){
		 window.location.href=ctx+'/admin/collectall';
	});
	
	$('.collectorOne').click(function(){
	
		tooltip.show('采集中...');
		var id = $(this).attr('itemid');
		$.post(ctx+'/admin/collectone',{itemid:id},function(result){
			console.log(result);
			if(result.status=='ok'){
				tooltip.show('采集成功');
			}else{
				tooltip.show('采集失败');
			}
			setTimeout(function(){
				tooltip.hide();
				
			},3000);
			
			
		});
		
	});
	

});