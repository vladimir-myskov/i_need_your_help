;(function($, window, document, undefined) {
    'use strict';

    function TicketsFilter(){
        var that=this;
        this.input = $("#filter");

        if($(this.input).val()) {
            $("[data-filter='"+$(this.input).val()+"']").addClass("alert");
        }

        $("[data-filter]").on("click", function(){
            if($(this).hasClass("alert")) {
                $(that.input).val("");
            } else {
                $(that.input).val($(this).data("filter"));
            }
            

            $(".filter-panel form").submit();
        });     
    }
    
    $(document).on("ready", function(){
        new TicketsFilter();
    });

})(jQuery, window, document);