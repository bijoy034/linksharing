/* =========================================================
Comment Form
============================================================ */
jQuery(document).ready(function(){

	jQuery('body').on("click",".close",function()	{
		jQuery(".bg-image").children('div').html('<img src="/linksharing/assets/spinner.gif" class="spinner">');
		jQuery(".bg-image").hide();
		jQuery(".modal-overlay").hide();

	});
	jQuery(".modal-overlay").click(function(){
		jQuery(".bg-image").children('div').html('<img src="/linksharing/assets/spinner.gif" class="spinner">');
		jQuery(".bg-image").hide();
		jQuery(".modal-overlay").hide();

	});
	jQuery(".modal-form").click(function(){
		jQuery(".modal-overlay").show();
		jQuery(".bg-image").show();
	});
	jQuery(".edit-topic").click(function(){
		var elem = jQuery(this).parent("div").parent("div").parent("article");
		elem.find(".show-text").toggle();
		elem.find(".edit-text").toggle();
	});
	jQuery(":reset").click(function(){
		var elem = jQuery(this).parent('th').parent('tr');
		elem.parent('tbody').parent('table').find(".show-text").show();
		elem.hide();
	});
	jQuery(".edit-subscription .select").change(function(){
		$(this).parent("div").parent("article").parent("form").submit();
	});
	jQuery("#ttopic li a").click(function(){
		jQuery("#ttopic").children("li").removeClass("active");
		jQuery("#ttopic").children("li").removeAttr("style")
		jQuery(this).parent("li").addClass("active");
		jQuery(this).parent("li").attr("style","font-weight:bold");
	});

	jQuery("#tpost li a").click(function(){
		jQuery("#tpost").children("li").removeClass("active");
		jQuery("#tpost").children("li").removeAttr("style")
		jQuery(this).parent("li").addClass("active");
		jQuery(this).parent("li").attr("style","font-weight:bold");
	});

    if(jQuery("#comments-form").length > 0){
	// Validate the contact form
	  jQuery('#comments-form').validate({
	
		// Add requirements to each of the fields
		rules: {
			name: {
				required: true,
				minlength: 2
			},
			email: {
				required: true,
				email: true
			},
			message: {
				required: true,
				minlength: 10
			}
		},
		
		// Specify what error messages to display
		// when the user does something horrid
		messages: {
			name: {
				required: "Please enter your name.",
				minlength: jQuery.format("At least {0} characters required.")
			},
			email: {
				required: "Please enter your email.",
				email: "Please enter a valid email."
			},
			url: {
				required: "Please enter your url.",
				url: "Please enter a valid url."
			},
			message: {
				required: "Please enter a message.",
				minlength: jQuery.format("At least {0} characters required.")
			}
		},
		
		// Use Ajax to send everything to processForm.php
		submitHandler: function(form) {
			jQuery("#submit-comment").attr("value", "Sending...");
			jQuery(form).ajaxSubmit({
				success: function(responseText, statusText, xhr, $form) {
					jQuery("#response").html(responseText).hide().slideDown("fast");
					jQuery("#submit-comment").attr("value", "Comment");
				}
			});
			return false;
		}
	  });
	}
	
	if(jQuery(".log-form").length > 0){
	// Validate the contact form
	  jQuery('.log-form').validate({
	
		// Add requirements to each of the fields
		rules: {
			name: {
				required: true,
				minlength: 2
			},
			email: {
				required: true,
				email: true
			},
			message: {
				required: true,
				minlength: 10
			}
		},
		
		// Specify what error messages to display
		// when the user does something horrid
		messages: {
			name: {
				required: "Please enter your name.",
				minlength: jQuery.format("At least {0} characters required.")
			},
			email: {
				required: "Please enter your email.",
				email: "Please enter a valid email."
			},
			url: {
				required: "Please enter your url.",
				url: "Please enter a valid url."
			},
			message: {
				required: "Please enter a message.",
				minlength: jQuery.format("At least {0} characters required.")
			}
		},
		
		// Use Ajax to send everything to processForm.php
		submitHandler: function(form) {
			jQuery(".submit-btn").attr("value", "Sending...");
			jQuery(form).ajaxSubmit({
				success: function(responseText, statusText, xhr, $form) {
					jQuery("#response").html(responseText).hide().slideDown("fast");
					jQuery(".submit-btn").attr("value", "Submit");
				}
			});
			return false;
		}
	  });
	}
	if(jQuery(".reg-form").length > 0){
		// Validate the contact form
		jQuery('.reg-form').validate({

			// Add requirements to each of the fields
			rules: {
				name: {
					required: true,
					minlength: 2
				},
				email: {
					required: true,
					email: true
				},
				message: {
					required: true,
					minlength: 10
				}
			},

			// Specify what error messages to display
			// when the user does something horrid
			messages: {
				name: {
					required: "Please enter your name.",
					minlength: jQuery.format("At least {0} characters required.")
				},
				email: {
					required: "Please enter your email.",
					email: "Please enter a valid email."
				},
				url: {
					required: "Please enter your url.",
					url: "Please enter a valid url."
				},
				message: {
					required: "Please enter a message.",
					minlength: jQuery.format("At least {0} characters required.")
				}
			},

			// Use Ajax to send everything to processForm.php
			submitHandler: function(form) {
				jQuery("#submit-contact").attr("value", "Sending...");
				jQuery(form).ajaxSubmit({
					success: function(responseText, statusText, xhr, $form) {
						jQuery("#response").html(responseText).hide().slideDown("fast");
						jQuery("#submit-contact").attr("value", "Submit");
					}
				});
				return false;
			}
		});
	}
});

/* =========================================================
HeadLine Scroller
============================================================ */

jQuery(function() {
	var _scroll = {
		delay: 1000,
		easing: 'linear',
		items: 1,
		duration: 0.07,
		timeoutDuration: 0,
		pauseOnHover: 'immediate'
	};
	/*jQuery('.ticker-1').carouFredSel({
		width: 1000,
		align: false,
		items: {
			width: 'variable',
			height: 40,
			visible: 1
		},
		scroll: _scroll
	});*/

	//	set carousels to be 100% wide
	jQuery('.caroufredsel_wrapper').css('width', '100%');
});

/* =========================================================
Sub menu
==========================================================*/
(function($){ //create closure so we can safely use $ as alias for jQuery

	jQuery(document).ready(function(){

		// initialise plugin
		var example = jQuery('#main-menu').superfish({
			//add options here if required
		});
	});

})(jQuery);

/* =========================================================
Mobile menu
============================================================ */
jQuery(document).ready(function () {
     
    jQuery('#mobile-menu > span').click(function () {
 
        var mobile_menu = jQuery('#toggle-view-menu');
 
        if (mobile_menu.is(':hidden')) {
            mobile_menu.slideDown('300');
            jQuery(this).children('span').html('-');    
        } else {
            mobile_menu.slideUp('300');
            jQuery(this).children('span').html('+');    
        }
		
		
         
    });
	
	jQuery('#toggle-view-menu li').click(function () {
 
        var text = jQuery(this).children('div.menu-panel');
 
        if (text.is(':hidden')) {
            text.slideDown('300');
            jQuery(this).children('span').html('-');    
        } else {
            text.slideUp('300');
            jQuery(this).children('span').html('+');    
        }
		
		jQuery(this).toggleClass('active');
         
    });
 
});

/* =========================================================
Flex Slider
============================================================ */
jQuery(window).load(function(){
  /*jQuery('.home-slider').flexslider({
	animation: "slide",
	start: function(slider){
	  jQuery('body').removeClass('loading');
	}
  });*/
  
  /*jQuery('.entry-thumb-slider').flexslider({
	animation: "slide",
	start: function(slider){
	  jQuery('body').removeClass('loading');
	}
  });*/
  
  /*jQuery('.gallery-slider').flexslider({
	animation: "slide",
	start: function(slider){
	  jQuery('body').removeClass('loading');
	}
  });*/
  
  /*jQuery('.kopa-single-slider').flexslider({
	animation: "slide",
	start: function(slider){
	  jQuery('body').removeClass('loading');
	}
  });*/
  
});

/* =========================================================
Tabs
============================================================ */
jQuery(document).ready(function() { 
	
	if( jQuery(".tab-content-1").length > 0){   
        //Default Action Product Tab
        jQuery(".tab-content-1").hide(); //Hide all content
        jQuery("ul.tabs-1 li:first").addClass("active").show(); //Activate first tab
        jQuery(".tab-content-1:first").show(); //Show first tab content
        //On Click Event Product Tab
        jQuery("ul.tabs-1 li").click(function() {
            jQuery("ul.tabs-1 li").removeClass("active"); //Remove any "active" class
            jQuery(this).addClass("active"); //Add "active" class to selected tab
            jQuery(".tab-content-1").hide(); //Hide all tab content
            var activeTab = jQuery(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
            jQuery(activeTab).fadeIn(); //Fade in the active content
            return false;
		
        });
    }
	
	if( jQuery(".tab-content-2").length > 0){   
        //Default Action Product Tab
        jQuery(".tab-content-2").hide(); //Hide all content
        jQuery("ul.tabs-2 li:first").addClass("active").show(); //Activate first tab
        jQuery(".tab-content-2:first").show(); //Show first tab content
        //On Click Event Product Tab
        jQuery("ul.tabs-2 li").click(function() {
            jQuery("ul.tabs-2 li").removeClass("active"); //Remove any "active" class
            jQuery(this).addClass("active"); //Add "active" class to selected tab
            jQuery(".tab-content-2").hide(); //Hide all tab content
            var activeTab = jQuery(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
            jQuery(activeTab).fadeIn(); //Fade in the active content
            return false;
		
        });
    }
	
	if( jQuery(".tab-content-3").length > 0){   
        //Default Action Product Tab
        jQuery(".tab-content-3").hide(); //Hide all content
        jQuery("ul.tabs-3 li:first").addClass("active").show(); //Activate first tab
        jQuery(".tab-content-3:first").show(); //Show first tab content
        //On Click Event Product Tab
        jQuery("ul.tabs-3 li").click(function() {
            jQuery("ul.tabs-3 li").removeClass("active"); //Remove any "active" class
            jQuery(this).addClass("active"); //Add "active" class to selected tab
            jQuery(".tab-content-3").hide(); //Hide all tab content
            var activeTab = jQuery(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
            jQuery(activeTab).fadeIn(); //Fade in the active content
            return false;
		
        });
    }
	
});

/* =========================================================
Carousel
============================================================ */
jQuery(window).load(function() {
	
    if( jQuery(".kopa-featured-news-carousel").length > 0){
		jQuery('.kopa-featured-news-carousel').carouFredSel({
			responsive: true,
			prev: '#prev-1',
			next: '#next-1',
			width: '100%',
			scroll: 1,
			pagination: "#pager2",
			auto: false,
			items: {
				width: 234,
				height: 'auto',
				visible: {				
					min: 1,
					max: 4
				}
			}
		});
	}
});

/* =========================================================
prettyPhoto
============================================================ */
jQuery(document).ready(function(){
    init_image_effect();
});

jQuery(window).resize(function(){
    init_image_effect();
});

function init_image_effect(){    

	var view_p_w = jQuery(window).width();
	var pp_w = 500;
	var pp_h = 344;
	
	if(view_p_w <= 479){
		pp_w = '120%';
		pp_h = '100%';
	}
	else if(view_p_w >= 480 && view_p_w <= 599){
		pp_w = '100%';
		pp_h = '170%';
	}
		    
    /*jQuery("a[rel^='prettyPhoto']").prettyPhoto({
        show_title: false,
        deeplinking:false,
        social_tools:false,
		default_width: pp_w,
		default_height: pp_h
    });*/
}

/* =========================================================
Twitter
============================================================ */
/*jQuery(function(){
	jQuery('#tweets').tweetable({
		username: 'philipbeel',
		time: true,
		rotate: false,
		speed: 4000,
		limit: 3,
		replies: false,
		position: 'append',
		failed: "Sorry, twitter is currently unavailable for this user.",
		html5: true,
		onComplete:function($ul){
			jQuery('time').timeago();
		}
	});
});*/

/* =========================================================
Accordion
========================================================= */
jQuery(document).ready(function() {
        var acc_wrapper=jQuery('.acc-wrapper');
        if (acc_wrapper.length >0) 
        {
			
            jQuery('.acc-wrapper .accordion-container').hide();
            jQuery.each(acc_wrapper, function(index, item){
                jQuery(this).find(jQuery('.accordion-title')).first().addClass('active').next().show();
				
            });
			
            jQuery('.accordion-title').on('click', function(e) {
                kopa_accordion_click(jQuery(this));
                e.preventDefault();
            });
			
			var titles = jQuery('.accordion-title');
			
			jQuery.each(titles,function(){
				kopa_accordion_click(jQuery(this));
			});
        }
		
});

function kopa_accordion_click (obj) {
	if( obj.next().is(':hidden') ) {
		obj.parent().find(jQuery('.active')).removeClass('active').next().slideUp(300);
		obj.toggleClass('active').next().slideDown(300);
							
	}
jQuery('.accordion-title span').html('+');
	if (obj.hasClass('active')) {
		obj.find('span').first().html('-');			     
	} 
}

/* =========================================================
Full Screen Background
============================================================ */
jQuery(document).ready(function(){
	var view_port_w;
		if(self.innerWidth!=undefined) view_port_w= self.innerWidth;
		else{
			var D= document.documentElement;
			if(D) view_port_w= D.clientWidth;
		}
	if(view_port_w > 1000){
		/*jQuery.backstretch([
			  "placeholders/01.jpg",
			  "placeholders/02.jpg",
			  "placeholders/03.jpg"
			], {
				fade: 750,
				duration: 4000
		});*/
	}
})

/* =========================================================
Toggle Boxes
============================================================ */
jQuery(document).ready(function () {
     
    jQuery('#toggle-view li').click(function (event) {
 		
        var text = jQuery(this).children('div.panel');
 
        if (text.is(':hidden')) {
			jQuery(this).addClass('active');
            text.slideDown('300');
            jQuery(this).children('span').html('-');			     
        } else {
			jQuery(this).removeClass('active');
            text.slideUp('300');
            jQuery(this).children('span').html('+');			   
        }
         
    });
 
});

/* =========================================================
Gallery slider
============================================================ */
jQuery(window).load(function(){
  
 /* jQuery('.kp-gallery-carousel').flexslider({
	animation: "slide",
	controlNav: false,
	slideshow: false,
	itemWidth: 149,
	itemMargin: 6,
	asNavFor: '.kp-gallery-slider'
  });*/
  
  /*jQuery('.kp-gallery-slider').flexslider({
	animation: "slide",
	controlNav: false,
	slideshow: false,
	sync: ".kp-gallery-carousel",
	start: function(slider){
	  jQuery('body').removeClass('loading');
	}
  });*/
});

/* =========================================================
Scroll to top
============================================================ */
jQuery(document).ready(function(){

	// hide #back-top first
	jQuery("#back-top").hide();
	
	// fade in #back-top
	jQuery(function () {
		jQuery(window).scroll(function () {
			if (jQuery(this).scrollTop() > 200) {
				jQuery('#back-top').fadeIn();
			} else {
				jQuery('#back-top').fadeOut();
			}
		});

		// scroll body to 0px on click
		jQuery('#back-top a').click(function () {
			jQuery('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});
	});

});
