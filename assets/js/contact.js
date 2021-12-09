$(document).ready(function() {

    (function($) {
        "use strict";


        jQuery.validator.addMethod('answercheck', function(value, element) {
            return this.optional(element) || /^\bcat\b$/.test(value);
        }, "type the correct answer -_-");

        // validate contactForm form
        $(function() {
            $('#contactForm').validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 2
                    },
                    subject: {
                        required: true,
                        minlength: 4
                    },
                    number: {
                        required: true,
                        minlength: 5
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    message: {
                        required: true,
                        minlength: 20
                    }
                },
                messages: {
                    name: {
                        required: "come on, you have a name, don't you?",
                        minlength: "your name must consist of at least 2 characters"
                    },
                    subject: {
                        required: "come on, you have a subject, don't you?",
                        minlength: "your subject must consist of at least 4 characters"
                    },
                    number: {
                        required: "come on, you have a number, don't you?",
                        minlength: "your Number must consist of at least 5 characters"
                    },
                    email: {
                        required: "no email, no message"
                    },
                    message: {
                        required: "um...yea, you have to write something to send this form.",
                        minlength: "thats all? really?"
                    }
                },
                submitHandler: function sendEmail() {
                    var name = $("#name");
                    var email = $("#email");
                    var subject = $("#subject");
                    var message = $("#message");


                    if (isNotEmpty(name) && isNotEmpty(email) && isNotEmpty(subject) && isNotEmpty(message)) {

                        $.ajax({
                            url: 'contact_process.php',
                            method: 'POST',
                            dataType: 'json',
                            data: {
                                name: name.val(),
                                email: email.val(),
                                subject: subject.val(),
                                message: message.val()
                            },
                            success: function(response) {
                                $('#mailForm')[0].reset();
                                $('.sent-notification').text("Message Sent Successfully.");
                                header('location:contact.php');
                            }
                        });


                    }
                },
                emptyHandler: function isNotEmpty(caller) {
                    if (caller.val() == "") {
                        caller.css('border', '1px solid red');
                        return false;
                    } else
                        caller.css('border', '');

                    return true;
                },
            });
        });

    })(jQuery);
});