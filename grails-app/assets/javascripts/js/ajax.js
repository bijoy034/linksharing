/**
 * Created by intelligrape on 16/6/15.
 */
jQuery(document).ready(function(){
    jQuery(".rating").click(function () {
        var resourceId = jQuery(this).parent("span").parent("div").find(".resourceId").val()
        jQuery.ajax({
         url: jQuery("#rating").val(),
         type: "post",
         data: {resourceId: parseInt(resourceId), score:parseInt(jQuery(this).val())},
         success: function (data) {
                jQuery("#avgRatingBody"+resourceId).html(data);
                jQuery("#rateLabel"+resourceId).html("Your rate for this post");
             }
         });
    });
});
