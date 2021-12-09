$(document).ready(function() {

    if (isSignedIn()) {
        // if user is signed in display user related content
        $('.signed_in').addClass('show');
        $('#signin_btn').addClass('hide');
        $('#signin_btn_i').addClass('hide');
        $('.signed_in').removeClass('hide');



        // log user out 
        $("#logout_btn").click(() => {
            logout();
        });

        $("#logout_btn_i").click(() => {
            logout_from_index();
        });


        // get user data
        const currentUserData = currentUser();
        $('#username').html(currentUserData.name);
        $('#avatar').attr('src', `https://avatars.dicebear.com/api/initials/${currentUserData.name}.svg`);
        $('.user_id').attr("value", currentUser().email);
        $('.userID').attr("value", currentUser().email);
        localStorage.setItem("user_email", currentUser().email);



        if (currentUserData.email != "nyantakyi42@gmail.com") {
            $('.hideupdate').attr('hidden', 'hidden');
        } else $('.hideupdate').removeAttr('hidden');

    } else if (!isSignedIn()) {

        $('.hideupdate').attr('hidden', 'hidden');

        $("#signin_btn").click(() => {
            signIn();
        });

        $(".event_btn").click(() => {
            signIn();
        });

        $("#signin_btn_i").click(() => {
            signIn_from_index();
        });

        $('.signed_in').removeClass('show');
        $('.signed_in').addClass('hide');

        $('#signin_btn').addClass('show');
        $('#signin_btn_i').removeClass('hide');
    }



});