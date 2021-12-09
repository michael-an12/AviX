$(document).ready(function() {


    user_id = localStorage.getItem("user_email");
    $.ajax({
        url: 'action.php',
        method: 'post',
        data: {
            user_id: user_id
        },
        success: function(response) {
            console.log(user_id);
        }
    });

    // Send product details in the server
    $(".addItemBtn").click(function(e) {
        if (!isSignedIn()) {
            alert('You must login to be able to add to cart');
            location.href = `../account_auth/signup_login.php`;
        }
        e.preventDefault();
        var $form = $(this).closest(".form-submit");
        var pid = $form.find(".pid").val();
        var pname = $form.find(".pname").val();
        var pprice = $form.find(".pprice").val();
        var pimage = $form.find(".pimage").val();
        var pcode = $form.find(".pcode").val();
        var user_id = $form.find(".user_id").val();

        var pqty = $form.find(".pqty").val();

        $.ajax({
            url: 'action.php',
            method: 'post',
            data: {
                pid: pid,
                pname: pname,
                pprice: pprice,
                pqty: pqty,
                pimage: pimage,
                pcode: pcode,
                user_id: user_id
            },
            success: function(response) {
                $("#message").html(response);
                window.scrollTo(0, 0);
                load_cart_item_number();
            }
        });



    });






    $('.cart').trigger("click");
    display_cart();


    // Load total no.of items added in the cart and display in the navbar
    load_cart_item_number();

    function load_cart_item_number() {
        $.ajax({
            url: 'action.php',
            method: 'get',
            data: {
                cartItem: "cart_item"
            },
            success: function(response) {
                $("#cart-item").html(response);
            }
        });
    }


});

function display_cart() {

    $(".cart").click(function(e) {

        e.preventDefault();
        user_id = $('.userID').val();
        $.ajax({
            url: 'cart.php',
            method: 'post',
            data: {
                user_id: user_id
            },
            success: function(response) {
                console.log(response);
            }
        });
    });

}