// Handles user registration
function registerUser() {
    // Clear the fields off their error styles if there are any
    clearFieldErrors();

    // Get the user's data from the form
    let userData = {
        name: $("#signup-name").val(),
        email: $("#signup-email").val(),
        password: $("#signup-pwd").val(),
        password2: $("#signup-pwd2").val(),
    };

    // Make a request to the php server, sending the user data to be processed
    const request = $.ajax({
        url: "./db_controller/authentication.php",
        type: "post",
        data: { userData },

        success: function(response) {
            // Check if the response is successful
            if (response.success) {
                // Display success message
                showSuccessMessage();

                // Wait a while and reload the page
                setTimeout(() => {
                    location.reload();
                }, 500);


                return;
            }
            console.log(response);

            // else, execute error condition
            // Display an error message
            showErrorMessage('#signup-message', response.error.message);

            // Show the fields that have errors on them
            showFormError(response.error.errorFields);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(textStatus);
            console.log(errorThrown);

            // Display an error message
            showErrorMessage({ message: "Oops, something went wrong!" });
        },
    });
}

// Handles signing in user
function loginUser() {
    clearFieldErrors();

    const userData_signIn = {
        email: $("#signin-email").val(),
        password: $("#signin-pwd").val(),
    };

    // Make a request to the php server, sending the user data to be processed
    const request = $.ajax({
        url: "./db_controller/authentication.php",
        type: "post",
        data: { userData_signIn },

        success: function(response) {
            if (response.success) {
                //store data in local storage
                localStorage.setItem('userData', JSON.stringify(response.data));

                location.href = "../";

            } else {

                // else, execute error condition
                // Display an error message
                showErrorMessage('#signin-message', response.error.message);

                // Show the fields that have errors on them
                showFormError(response.error.errorFields, {
                    password: "#signin-pwd",
                    email: "#signin-email",

                });
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(textStatus);
            console.log(errorThrown);
        },
    });
}

// Display an error message once the process fails
function showErrorMessage(
    tag = "#signup-message",
    message = "Kindly enter the correct values!"
) {
    // Add a failure style
    $(tag).addClass("form-error");

    // Insert message in html dom
    $(tag).html(message);
}

// Display a success message once process is successfully completed
function showSuccessMessage(
    tag = "#signup-message",
    message = "Successfully created an account!"
) {
    // Add a success style
    $(tag).addClass("form-success");

    // Insert message in html dom
    $(tag).html(message);
}

/**
 * 
 * @param [*] formFields An array of field basic names. Eg. ['name', 'email']
 * @param {*} fieldIds Holds Ids of the fields. This is added so that they can easily be changed if necessary without disrupting the flow of data
 */
function showFormError(formFields, fieldIds = {
    name: "#signup-name",
    email: "#signup-email",
    password: "#signup-pwd",
    password2: "#signup-pwd2",
}) {

    // Show the error state of each field present and reference the dom id
    formFields.forEach((field) => {
        $(fieldIds[field]).addClass("input-error");
    });
}

// Clears error styles from fields
function clearFieldErrors() {
    // Remove error class from each field
    ["#signup-name", "#signup-email", "#signup-pwd", "#signup-pwd2", "#signin-email", "#signin-pwd"].forEach(
        (field) => {
            $(field).removeClass("input-error");
        }
    );
}

// Get current user either from local storage or server session
function currentUser() {
    //Server side

    //Client side
    // Check if there is a stored user data
    if (localStorage.getItem('userData')) return JSON.parse(localStorage.getItem('userData'));

    return null;


}

function logout() {
    //Clear the local storage of user data
    setTimeout(() => {
        location.reload();
    }, 500);

    localStorage.removeItem('userData');
    localStorage.removeItem("user_email");
    location.href = `../account_auth/signup_login.php`;
}

function signIn() {
    //redirect to sign in page
    location.href = `../account_auth/signup_login.php`;
}

function logout_from_index() {
    //Clear the local storage of user data
    localStorage.removeItem('userData');
    localStorage.removeItem("user_email");
    setTimeout(() => {
        location.reload();
        location.href = `./account_auth/signup_login.php`;
    }, 10);

}

function signIn_from_index() {
    //redirect to sign in page
    location.href = `./account_auth/signup_login.php`;
}


function isSignedIn() {
    if (currentUser()) return true;
    return false;
}