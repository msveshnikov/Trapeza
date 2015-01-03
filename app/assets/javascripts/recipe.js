$(document).on('page:change', function () {
    $('.fav').click(function () {
        $.ajax({
            url: "/recipes/toggle/" + $(this).attr("id"),
            type: "GET",
            success: function (text) {
                $(".fav").attr('src', "/assets/star-" + text + ".png");
            }
        });
        return false;
    });
});

