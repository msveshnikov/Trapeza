$(document).on('page:change', function () {
    $('.fav').click(function () {
        $.ajax({
            url: "/recipes/toggle/" + $(this).attr("id"),
            type: "GET",
            success: function (text) {
                $(".fav").attr('src', "/assets/" + text);
            }
        });
        return false;
    });

    $('#search-form').submit(function () {
        if ($('#search-field').val().length < 1) {
            return false;
        }
    });
});

