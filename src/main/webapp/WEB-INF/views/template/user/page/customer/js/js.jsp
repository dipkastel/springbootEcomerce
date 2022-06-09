<%@ page contentType="text/html; charset=UTF-8" %>


<script>
    function IsPhone(phone) {
        var regex =   /^09(1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}$/;
        if(!regex.test(phone)) {
            return false;
        }else{
            return true;
        }
    }

    $('#btnSave')
        .on(
            'click',
            function () {
                let fname = $('#fname');
                let fnameError = $('#fname-error');
                let lname = $('#lname');
                let lnameError = $('#lname-error');
                let email = $('#email');
                let emailError = $('#email-error');
                let nationalCode = $('#nationalCode');
                let nationalCodeError = $('#nationalCode-error');
                let hasSubmit = [];

                if (nationalCode.val().length !==10) {
                    hasSubmit.push(1);
                    nationalCode.addClass(
                        'form-control is-invalid');
                    nationalCodeError.html(
                        'کد ملی درست نیست');
                }
                if (email.val().length > 250) {
                    hasSubmit.push(1);
                    email.addClass(
                        'form-control is-invalid');
                    emailError.html(
                        'ایمیل طولانی است');
                }
                if (lname.val().length > 250) {
                    hasSubmit.push(1);
                    lname.addClass(
                        'form-control is-invalid');
                    lnameError.html(
                        'نام خانوادگی طولانی است');
                }
                if (fname.val().length > 250) {
                    hasSubmit.push(1);
                    fname.addClass(
                        'form-control is-invalid');
                    fnameError.html(
                        'نام طولانی است');
                }
                if (fname.val().length === 0) {
                    hasSubmit.push(1);
                    fname.addClass(
                        'form-control is-invalid');
                    fnameError.html(
                        'نام را وارد کنید');
                }

                if (lname.val().length === 0) {
                    hasSubmit.push(1);
                    lname.addClass(
                        'form-control is-invalid');
                    lnameError.html(
                        'نام خانوادگی را وارد کنید');
                }


                if (email.val().length === 0) {
                    hasSubmit.push(1);
                    email.addClass(
                        'form-control is-invalid');
                    emailError.html(
                        'ایمیل را وارد کنید');
                }



                if (hasSubmit.length === 0) {
                    $('#frm').submit();
                }

            });
</script>
