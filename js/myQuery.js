 if(typeof jQuery!=="function"){
	throw new Error("未引入jquery");
}else{

	/*************dropdown*****************/
	$(()=>{
		$("[data-trigger=dropdown]").parent()
		  .hover(function(){
			$(this).children().last()
					.toggleClass("in")
		})
	});


	/*************accordion**************/
	$(()=>{
		$("[data-trigger='tab']").on("click",".title",e=>
					$(e.target).next(".content").toggleClass("in")
						.siblings(".content").removeClass("in")
		);
	})


}