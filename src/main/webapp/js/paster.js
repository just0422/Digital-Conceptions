(function($){

	$.fn.paster = function(options){
		
		return this.each(function(index, element){
			
			var $this = $(element);
			var settings = $.extend({
				onUpdate:undefined
	        }, options);

	        if(options && typeof(options) === "string"){
	        	if(options === "clear"){
	        		clearPaster();
	        		return
	        	}
	        	return
	        }

	        function clearPaster(){
	        	$this.off("paste");
	        }

			$this.on("paste", function(){
				
				var before = $this.html();

				setTimeout(function(){
					
					var after = $this.html();
					var pos1 = -1;
					var pos2 = -1;

					for (var i=0; i<after.length; i++) {
				        if (pos1 == -1 && before.substr(i, 1) != after.substr(i, 1)) pos1 = i-1;
				        if (pos2 == -1 && before.substr(before.length-i-1, 1) != after.substr(after.length-i-1, 1)) pos2 = i-1;
				    }
					
					var pasted = after.substr(pos1, after.length-pos2-pos1);
			        var replace = $("<p>" + pasted + "</p>").text();
			        var replaced = after.substr(0, pos1)+replace+after.substr(pos1+pasted.length);
			        $this.html(replaced);

			        if(typeof settings.onUpdate != "undefined") settings.onUpdate($this, index);

				}, 50);

			});	

		});
	}

}(jQuery));