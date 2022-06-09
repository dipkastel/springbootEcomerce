<style>
    .ps-my-account {
        background-color: #f1f1f1;
    }

    .ps-form--account {
        max-width: 430px;
        margin: 0 auto;
        padding: 40px 0 100px 0;
    }

    .ps-form--account .ps-tab-list {
        text-align: center;
        margin-bottom: 30px;
    }

    .ps-form--account .ps-tab-list li {
        display: inline-block;
        padding: 0 15px;
    }

    .ps-form--account .ps-tab-list li a {
        font-size: 30px;
        color: #666;
        font-weight: 600;
    }

    .ps-form--account .ps-tab-list li.active a {
        color: #000;
    }

    .ps-form--account .form-forgot {
        position: relative;
    }

    .ps-form--account .form-forgot input {
        padding-left: 100px;
    }

    .ps-form--account .form-forgot > a {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        left: 10px;
        color: #06c;
    }

    .ps-form--account .form-forgot > a:hover {
        color: #6ab9b7;
    }

    .ps-form--account .ps-checkbox > label {
        color: #000;
    }

    .ps-form--account .ps-form__content {
        padding: 30px 30px 0;
    }

    .ps-form--account .ps-form__content h5 {
        margin: 0 0 25px;
        font-size: 16px;
        font-weight: 400;
    }

    .ps-form--account .ps-form__footer {
        padding: 10px;
    }

    .ps-form--account .ps-tab {
        background-color: #ffffff;
    }

    .ps-checkbox {
        position: relative;
        display: block;
    }

    .ps-checkbox > input {
        position: absolute;
        visibility: hidden;
        box-sizing: border-box;
    }

    .ps-checkbox label {
        margin-bottom: 0;
        position: relative;
        padding-right: 30px;
        color: rgba(0, 0, 0, 0.5);
        font-weight: 400;
        cursor: pointer;
    }

    .ps-checkbox label:before {
        content: '';
        display: block;
        position: absolute;
        right: 0;
        top: 0px;
        height: 20px;
        width: 20px;
        z-index: 10;
        border: 1px solid #000;
        transition: all .4s ease;
    }

    .ps-checkbox label:after {
        content: '';
        display: block;
        position: absolute;
        top: 4px;
        right: 7px;
        width: 6px;
        height: 10px;
        border: 2px solid #fff;
        border-top: none;
        border-left: none;
        z-index: 10;
        opacity: 0;
        transform: rotate(0deg);
        transition: all .4s ease;
    }

    .ps-checkbox input[type=checkbox]:checked ~ label:before {
        background-color: #222222;
        border-color: #222222;
    }

    .ps-checkbox input[type=checkbox]:checked ~ label:after {
        transform: rotate(45deg);
        opacity: 1;
    }

    .ps-checkbox--inline {
        display: inline-block;
        margin-bottom: 1rem;
    }

    .ps-checkbox--color {
        margin-right: 1rem;
    }

    .ps-checkbox--color > label {
        margin-bottom: 0;
        width: 20px;
        height: 20px;
        padding-left: 0;
        background-color: transparent;
        border-radius: 50%;
        transition: all .4s ease;
    }

    .ps-checkbox--color > label:before {
        width: 20px;
        height: 20px;
        position: absolute;
        top: 50%;
        right: 50%;
        transform: translate(-50%, -50%);
        border: none;
        border-radius: 50%;
    }

    .ps-checkbox--color > label:after {
        display: none !important;
    }

    .ps-checkbox--color input[type=radio]:checked ~ label {
        background-color: transparent;
    }

    .ps-checkbox--color input[type=radio]:checked ~ label:before {
        background-color: transparent;
        border: 1px solid #ccc;
    }

    .ps-section--account {
        padding: 60px 0;
    }

    .ps-section--account .ps-section__header {
        padding-bottom: 30px;
    }

    .ps-section--account .ps-section__header h3 {
        font-weight: 600;
    }

    .ps-widget--account-dashboard .ps-widget__header {
        display: flex;
        flex-flow: row nowrap;
        justify-content: space-between;
        align-items: flex-start;
        padding-bottom: 20px;
    }

    .ps-widget--account-dashboard .ps-widget__header img {
        flex-basis: 60px;
        max-width: 60px;
        border-radius: 50%;
    }

    .ps-widget--account-dashboard .ps-widget__header figure {
        flex-basis: 100%;
        padding-right: 10px;
    }

    .ps-widget--account-dashboard .ps-widget__header figure figcaption {
        font-size: 16px;
        color: #666;
    }

    .ps-widget--account-dashboard .ps-widget__header figure p {
        margin-bottom: 0;
        font-size: 16px;
        font-weight: 600;
        color: #000;
    }

    .ps-widget--account-dashboard .ps-widget__content ul {
        border: 1px solid #d1d1d1;
    }

    .ps-widget--account-dashboard .ps-widget__content ul li {
        border-bottom: 1px solid #d1d1d1;
    }

    .ps-widget--account-dashboard .ps-widget__content ul li a {
        display: block;
        padding: 15px 20px;
        line-height: 20px;
        font-size: 16px;
        font-weight: 500;
        color: #000;
        text-transform: capitalize;
    }

    .ps-widget--account-dashboard .ps-widget__content ul li a i {
        margin-left: 10px;
    }

    .ps-widget--account-dashboard .ps-widget__content ul li a:hover {
        background-color: #6ab9b7;
        color: #fff;
    }

    .ps-widget--account-dashboard .ps-widget__content ul li:last-child {
        border-bottom: none;
    }

    .ps-widget--account-dashboard .ps-widget__content ul li.active {
        background-color: #6ab9b7;
    }

    .ps-widget--account-dashboard .ps-widget__content ul li.active a {
        color: #fff;
    }

</style>
