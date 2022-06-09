<%@ page contentType="text/html; charset=UTF-8" %>
<script>
    function IsEmail(email) {
        var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regex.test(email)) {
            return false;
        }else{
            return true;
        }
    }

    $('#btnRegister')
        .on(
            'click',
            function () {
                let phone = $('#phone');
                let phoneError = $('#phone-error');
                let hasSubmit = [];

                if (phone.val().length !==11) {
                    hasSubmit.push(1);
                    phone.addClass(
                        'form-control is-invalid');
                    phoneError.html(
                        'تلفن همراه باید 11 رقم باشد');
                }else{
                    phone.removeClass(
                        'is-invalid');
                    phoneError.html('');
                }

                if (phone.val().length === 0) {
                    hasSubmit.push(1);
                    phone.addClass(
                        'form-control is-invalid');
                    phoneError.html(
                        'تلفن همراه لازم است');
                }else{
                    phone.removeClass(
                        'is-invalid');
                    phoneError.html('');
                }
                if (!phone.val().match("^09[0|1|2|3][0-9]{8}$")) {
                    hasSubmit.push(1);
                    phone.addClass(
                        'form-control is-invalid');
                    phoneError.html(
                        'تلفن همراه اشتباه است');
                }else{
                    phone.removeClass(
                        'is-invalid');
                    phoneError.html('');
                }

                if (hasSubmit.length === 0) {
                    $('#frm').submit();
                }

            });
</script>

<script>
    $('#btnUpdate')
        .on(
            'click',
            function () {
                let old = $('#old');
                let oldError = $('#old-error');
                let newPass = $('#new');
                let newPassError = $('#new-error');
                let confirm = $('#confirm');
                let confirmError = $('#confirm-error');
                let hasSubmit = [];

                if (confirm.val().length > 250) {
                    hasSubmit.push(1);
                    confirm.addClass(
                        'form-control is-invalid');
                    confirmError.html(
                        'کلمه عبور طولانی است');
                }
                if (newPass.val().length > 250) {
                    hasSubmit.push(1);
                    newPass.addClass(
                        'form-control is-invalid');
                    newPassError.html(
                        'کلمه عبور طولانی است');
                }
                if (old.val().length > 250) {
                    hasSubmit.push(1);
                    old.addClass(
                        'form-control is-invalid');
                    oldError.html(
                        'کلمه عبور طولانی است');
                }




                if (old.val().length === 0) {
                    hasSubmit.push(1);
                    old.addClass(
                        'form-control is-invalid');
                    oldError.html(
                        'کلمه عبور فعلی را وارد نمایید');
                }



                if (newPass.val().length === 0) {
                    hasSubmit.push(1);
                    newPass.addClass(
                        'form-control is-invalid');
                    newPassError.html(
                        'کلمه عبور جدید را وارد کنید');
                }

                if (confirm.val().length === 0) {
                    hasSubmit.push(1);
                    confirm.addClass(
                        'form-control is-invalid');
                    confirmError.html(
                        'تکرار کلمه عبور را وارد نمایید');
                }

                if (confirm.val() !== newPass.val()) {
                    hasSubmit.push(1);
                    confirm.addClass(
                        'form-control is-invalid');
                    confirmError.html(
                        'تکرار کلمه عبور متفاوت است');
                }


                if (hasSubmit.length === 0) {
                    $('#frmPassword').submit();
                }

            });
</script>
