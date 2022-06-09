<style>
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
    }s

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
    .ps-section__left {
        background: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px #ddd;
    }

    .ps-section__right {
        background: #ffffff;
        border-radius: 10px;
        padding: 50px;
        box-shadow: 0 0 10px #ddd;
    }


    .ps-widget--account-dashboard .ps-widget__content ul li a {
        display: block;
        padding: 10px;
        font-size: 13px;
        color: #000;
        border: 1px solid #eee;
        border-radius: 10px;
        margin: 10px;
    }

    .ps-widget--account-dashboard .ps-widget__content ul li a i {
        margin-left: 10px;
    }

    .ps-widget--account-dashboard .ps-widget__content ul li a:hover {
        background-color: #ececec;
    }

    .ps-widget--account-dashboard .ps-widget__content ul li:last-child {
        border-bottom: none;
    }

    .ps-widget--account-dashboard .ps-widget__content ul li.active a {
        background-color: #6ab9b7;
        color: #fff;
    }

    .ps-widget__content span {
        float: left;
        background: #cfebea;
        padding: 5px 6px;
        color: #6ab9b7;
        border-radius: 10px;
        font-weight: 900;
        position: absolute;
        left: 0;
        top: 0;
        margin: 5px;
    }
    .ps-widget__header i {
        width: 40px;
        height: 40px;
        font-size: 40px;
        margin-right: 15px;
    }
</style>
