;
(function($) {
	$.fn.zebra=function(options){
		var defaults = {
			title:'red',
			oddLine:'blue',
			evenLine:'green'
		};
		var opts = $.extend(defaults, options);
		$(this).find(".title").css("background-color", opts.title);
		$(this).find(".item:odd").css("background-color", opts.oddLine);
		$(this).find(".item:even").css("background-color", opts.evenLine);
	};

})(jQuery);

