<style>

    .widget_features {
        margin-bottom: 30px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 0 10px #eee;
        padding: 20px;
        text-align: right;
    }

    .widget_features p {
        position: relative;
        margin-bottom: 20px;
        padding-right: 50px;
        color: #000;
        line-height: 1.4em;
    }

    .widget_features p i {
        position: absolute;
        top: 0;
        right: 0;
        margin-left: 10px;
        font-size: 26px;
        color: #000;
    }

    .ps-page--product {
        padding-top: 30px;
    }

    .ps-page--product .ps-page__container {
        display: flex;
        flex-flow: row nowrap;
        width: 100%;
    }

    .ps-page--product .ps-page__container > * {
        width: 100%;
    }

    .ps-page--product .ps-page__container .ps-page__left {
        padding-left: 30px;
        max-width: calc(100% - 290px);
    }

    .ps-page--product .ps-page__container .ps-page__right {
        min-width: 290px;
        max-width: 290px;
    }

    .ps-page--product .ps-page__right .widget_same-brand {
        border-bottom: 1px solid #eaeaea;
    }

    .ps-page--product.reverse .ps-page__container {
        flex-flow: row-reverse nowrap;
    }

    .ps-page--product.reverse .ps-page__right {
        padding-right: 30px;
    }

    .ps-page--product-box {
        background-color: #f1f1f1;
    }

    .ps-product--detail .ps-product__header {
        display: flex;
        flex-flow: row nowrap;
        background: #fff;
        padding: 10px;
        border-radius: 10px;
        box-shadow: 0 0 10px #eee;
    }

    .ps-product--detail .ps-product__header > * {
        width: 100%;
    }

    .ps-product--detail .ps-product__header .ps-product__thumbnail {
        max-width: 43%;
    }

    .ps-product--detail .ps-product__header .ps-product__info {
        max-width: 54%;
        padding: 0px 0px 0 9px;
        margin-top: 17px;
        overflow: auto;
        max-height: calc(100% - 5.5rem);
        margin-right: 15px;
    }

    .ps-product--detail > .ps-product__content {
        background: #fff;
        margin: 20px 0;
        border-radius: 10px;
        box-shadow: 0 0 10px #eee;
    }

    .ps-product--detail .ps-tab-list {
        position: relative;
        display: block;
        padding-left: 0;
        border-bottom: 1px solid #e1e1e1;
    }

    .ps-product--detail .ps-tab-list li {
        display: inline-block;
    }

    .ps-product--detail .ps-tab-list li a {
        position: relative;
        display: block;
        color: #999999;
        font-size: 20px;
        padding: 15px 20px;
        line-height: 20px;
        font-weight: 600;
    }

    .ps-product--detail .ps-tab-list li a:before {
        content: '';
        position: absolute;
        top: 100%;
        right: 0;
        width: 100%;
        height: 3px;
        background-color: #6ab9b7;
        transform: scale3d(0, 1, 1);
        transform-origin: 100% 50%;
        transition: transform 0.75s cubic-bezier(0.77, 0, 0.175, 1);
    }

    .ps-product--detail .ps-tab-list li a:hover {
        color: #000;
    }

    .ps-product--detail .ps-tab-list li a:hover:before {
        transform: scale3d(1, 1, 1);
        transform-origin: 0 50%;
    }

    .ps-product--detail .ps-tab-list li:last-child {
        margin-right: 0;
    }

    .ps-product--detail .ps-tab-list li.active a {
        color: #000;
        border-color: #000;
    }

    .ps-product--detail .ps-tab-list li.active a:before {
        transform: scale3d(1, 1, 1);
        transform-origin: 0 50%;
    }

    .ps-product--detail .ps-tab p {
        margin-bottom: 25px;
    }

    .ps-product--detail .ps-product .ps-product__price {
        font-size: 16px;
        font-weight: 400;
    }

    .ps-product--detail.ps-product--thumbnail-right .ps-product__thumbnail {
        flex-flow: row nowrap;
    }

    .ps-product--detail.ps-product--thumbnail-right .ps-product__thumbnail figure {
        padding-left: 0;
        padding-right: 10px;
    }


    .ps-product--detail {
        margin-bottom: 5rem;
    }

    .ps-product--detail h1 {
        margin-bottom: 10px;
        font-size: 17px;
        padding-bottom: 15px;
        border-bottom: 1px solid #ddd;
        color: #000;
        font-weight: 400;
        line-height: 1.2;
    }
    .ps-product--detail .ps-product__variants .item {
        cursor: pointer;
    }

    .ps-product--detail .ps-product__variants .item img {
        opacity: 0.5;
        transition: all 0.4s ease;
    }

    .ps-product--detail .ps-product__variants .item .ps-video {
        position: relative;
        z-index: 10;
    }

    .ps-product--detail .ps-product__variants .item .ps-video:before {
        content: '\f04b';
        font-family: FontAwesome;
        position: absolute;
        top: 50%;
        right: 50%;
        transform: translate(-50%, -50%);
        color: white;
        z-index: 20;
    }

    .ps-product--detail .ps-product__variants .item:last-child {
        margin-bottom: 0;
    }

    .ps-product--detail .ps-product__variants .item:hover img {
        width: 100%;
        opacity: 1;
    }

    .ps-product--detail .ps-product__gallery {
        position: relative;
    }


    .ps-product--detail .ps-product__gallery:hover .item:before {
        visibility: visible;
        opacity: 1;
    }


    .ps-product--detail .ps-product__video a {
        vertical-align: middle;
    }

    .ps-product--detail .ps-product__video a:hover.ps-btn--black {
        background-color: #6ab9b7;
        border-color: #6ab9b7;
    }

    .ps-product--detail .ps-product__video i {
        font-size: 20px;
        font-weight: bold;
        vertical-align: middle;
    }

    .ps-product--detail .ps-product__badge {
        display: inline-block;
        position: absolute;
        top: 10px;
        left: 10px;
        z-index: 30;
        padding: 0 5px;
        background-color: #fe9931;
    }

    .ps-product--detail .ps-product__badge i {
        font-style: normal;
        color: #ffffff;
        text-align: center;
        line-height: 1.2em;
        font-size: 1.3rem;
        letter-spacing: 0.2em;
    }

    .ps-product--detail .ps-product__info {
        text-align: right;
    }

    .ps-product--detail .ps-product__meta {
        display: flex;
        flex-flow: row nowrap;
        align-items: flex-start;
        margin-bottom: 20px;
        border-bottom: 1px solid #e1e1e1;
    }

    .ps-product--detail .ps-product__meta p {
        position: relative;
        display: inline-block;
        margin-bottom: 0;
        margin-left: 10px;
        padding-left: 10px;
        line-height: 20px;
    }

    .ps-product--detail .ps-product__meta p a {
        color: #06c;
    }

    .ps-product--detail .ps-product__meta p:after {
        content: '';
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        left: 0;
        width: 1px;
        height: 14px;
        background-color: #cccccc;
    }

    .ps-product--detail .ps-product__meta .ps-product__rating {
        display: flex;
        flex-flow: row nowrap;
    }

    .ps-product--detail .ps-product__meta .ps-product__rating .br-wrapper a {
        font-size: 14px;
    }

    .ps-product--detail .ps-product__meta .ps-product__rating span {
        margin-right: 10px;
        color: #666;
    }

    .ps-product--detail .ps-product__price {
        margin-bottom: 20px;
        font-size: 24px;
        font-weight: 600;
        color: #000;
    }

    .ps-product--detail .ps-product__price.sale {
        color: #ec0101;
    }

    .ps-product--detail .ps-product__price.sale del {
        margin-right: 10px;
        font-size: 22px;
        color: #666;
    }

    .ps-product--detail .ps-product__price del {
        font-style: normal;
        color: #bcbcbc;
        font-size: 1.3rem;
    }

    .ps-product--detail .ps-product__price.sale del {
        margin-right: 0;
        font-size: 16px;
        font-weight: 500;
    }

    .ps-product--detail .ps-product__price.sale small {
        font-size: 16px;
        font-weight: 500;
    }

    .ps-product--detail .ps-product__desc {
        margin-bottom: 20px;
        border-bottom: 1px solid #e1e1e1;
    }

    .ps-product--detail .ps-product__desc p {
        color: #000;
    }

    .ps-product--detail .ps-product__desc p a {
        text-transform: uppercase;
        font-weight: 600;
        color: #09c;
        font-size: 16px;
    }

    .ps-product--detail .ps-product__desc p strong {
        font-weight: 600;
    }

    .ps-product--detail .ps-product__desc .ps-tag--in-stock {
        font-size: 14px;
    }

    .ps-product--detail .ps-product__desc .ps-tag--out-stock {
        color: red;
        text-transform: none;
        font-size: 14px;
    }

    .ps-product--detail .ps-product__desc ul {
        list-style-type: none;
    }

    .ps-product--detail .ps-product__desc ul li {
        color: #666;
    }

    .ps-product--detail .ps-product__desc ul li:before {
        top: 6px;
        background-color: #999;
        width: 6px;
        height: 6px;
    }

    .ps-product--detail .ps-product__shopping {
        display: flex;
        margin-bottom: 3rem;
        padding-bottom: 30px;
        flex-flow: row nowrap;
        align-items: flex-end;
    }

    .ps-product--detail .ps-product__shopping > * {
        margin-left: 30px;
    }

    .ps-product--detail .ps-product__shopping figure figcaption {
        margin-bottom: 4px;
    }

    .ps-product--detail .ps-product__shopping .form-group--number {
        max-width: 115px;
    }

    .ps-product--detail .ps-product__shopping .form-group--number input {
        border-radius: 0;
        border-color: rgba(0, 0, 0, 0.25);
    }

    .ps-product--detail .ps-product__shopping .form-group--number i {
        color: rgba(0, 0, 0, 0.25);
    }

    .ps-product--detail .ps-product__shopping .ps-btn {
        font-weight: 600;
        padding-left: 30px;
        padding-right: 30px;
        vertical-align: top;
        max-height: 50px;
        color: #ffffff;
        font-size: 18px;
    }

    .ps-product--detail .ps-product__shopping .ps-btn.ps-btn--black {
        color: #ffffff;
    }

    .ps-product--detail .ps-product__shopping .ps-btn--gray {
        background-color: rgba(0, 0, 0, 0.5);
        color: #ffffff;
    }

    .ps-product--detail .ps-product__shopping .ps-product__favorite {
        position: relative;
        display: inline-block;
        margin-right: 0;
        width: 40px;
        height: 40px;
        vertical-align: top;
        border: 1px solid #000;
        border-radius: 50%;
    }

    .ps-product--detail .ps-product__shopping .ps-product__favorite i {
        padding-top: 2px;
        position: absolute;
        top: 50%;
        right: 50%;
        transform: translate(-50%, -50%);
    }

    .ps-product--detail .ps-product__shopping .ps-product__favorite:hover {
        border-color: #6ab9b7;
    }

    .ps-product--detail .ps-product__shopping .ps-product__actions {
        margin-right: 0;
    }

    .ps-product--detail .ps-product__shopping .ps-product__actions a {
        display: inline-block;
        margin-right: 20px;
        font-size: 26px;
        color: #999;
    }

    .ps-product--detail .ps-product__shopping .ps-product__actions a:last-child {
        margin-right: 0;
    }

    .ps-product--detail .ps-product__shopping.extend {
        align-items: flex-start;
        flex-flow: column wrap;
    }

    .ps-product--detail .ps-product__shopping.extend > * {
        margin-right: 0;
    }

    .ps-product--detail .ps-product__shopping.extend .ps-product__btn-group {
        margin-bottom: 20px;
        width: 100%;
        display: flex;
        flex-flow: row nowrap;
        justify-content: space-between;
        align-items: flex-end;
        max-width: 420px;
    }

    .ps-product--detail .ps-product__shopping.extend .ps-product__btn-group .ps-btn {
        min-width: 180px;
        text-align: center;
    }

    .ps-product--detail .ps-product__shopping.extend > .ps-btn {
        width: 100%;
        text-align: center;
    }

    .ps-product--detail .ps-product__links {
        margin-bottom: 3rem;
    }

    .ps-product--detail .ps-product__links a {
        display: inline-block;
        margin-right: 20px;
        font-weight: 600;
        color: #000;
    }

    .ps-product--detail .ps-product__links a:hover {
        color: #6ab9b7;
    }

    .ps-product--detail .ps-product__specification {
        margin-bottom: 10px;
    }

    .ps-product--detail .ps-product__specification .report {
        text-decoration: underline;
    }

    .ps-product--detail .ps-product__specification .in-stock {
        color: #8bc500;
        font-weight: 600;
    }

    .ps-product--detail .ps-product__specification p {
        color: #000;
        margin-bottom: 0;
    }

    .ps-product--detail .ps-product__specification p strong {
        font-weight: 400;
        margin-right: 5px;
    }

    .ps-product--detail .ps-product__specification p a {
        color: #666;
    }

    .ps-product--detail .ps-product__specification p a:hover {
        color: #6ab9b7;
    }

    .ps-product--detail .ps-product__specification p.categories a {
        color: #09c;
    }

    .ps-product--detail .ps-product__sharing {
        padding-top: 2rem;
        margin-bottom: 0;
    }

    .ps-product--detail .ps-product__sharing p {
        line-height: 30px;
        color: #000;
        font-weight: 500;
    }

    .ps-product--detail .ps-product__sharing a {
        display: inline-block;
        width: 40px;
        height: 40px;
        margin-right: 10px;
        vertical-align: top;
    }

    .ps-product--detail .ps-product__sharing a i {
        position: absolute;
        top: 50%;
        right: 50%;
        transform: translate(-50%, -50%);
        font-size: 20px;
        color: #ffffff;
    }

    .ps-product--detail .ps-product__sharing a:last-child {
        margin-right: 0;
    }

    .ps-product--detail .ps-product__sharing a:hover {
        color: #fff;
        background-color: #6ab9b7;
    }

    .ps-product--detail .ps-product__sharing a.facebook {
        background-color: #3b5999;
    }

    .ps-product--detail .ps-product__sharing a.twitter {
        background-color: #55acee;
    }

    .ps-product--detail .ps-product__sharing a.google {
        background-color: #dd4b39;
    }

    .ps-product--detail .ps-product__sharing a.linkedin {
        background-color: #0077B5;
    }

    .ps-product--detail .ps-product__bundle {
        margin-bottom: 2rem;
    }

    .ps-product--detail .ps-product__bundle h4 {
        font-weight: 600;
        font-size: 2.1rem;
    }

    .ps-product--detail .ps-product__bundle .form-group {
        margin-bottom: 15px;
    }

    .ps-product--detail .ps-product__bundle p {
        margin-bottom: 15px;
    }

    .ps-product--detail .ps-product__bundle p strong {
        font-weight: 600;
        color: #696969;
    }

    .ps-product--detail .ps-product__bundle .ps-checkbox {
        margin-bottom: 10px;
    }

    .ps-product--detail .ps-product__bundle-item p {
        margin-bottom: 0;
    }

    .ps-product--detail .ps-product__bundle-item img {
        margin-bottom: 10px;
        max-width: 100px;
    }

    .ps-product--detail .ps-product__bundle-item span {
        padding: 0 5px;
    }

    .ps-product--detail .ps-product__group img {
        max-width: 80px;
    }

    .ps-product--detail .ps-product__group .form-group--number {
        min-width: 100px;
    }

    .ps-product--detail .ps-product__group .form-group--number .form-control {
        border-radius: 0;
    }

    .ps-product--detail .ps-product__group table tr td {
        padding: 10px;
    }

    .ps-product--detail .ps-product__group table tr td a {
        color: #000;
    }

    .ps-product--detail .ps-product__group table tr td a:hover {
        color: #666;
    }

    .ps-product--detail .ps-product__group table tr td:nth-child(2) {
        min-width: 230px;
    }

    .ps-product--detail .ps-gallery__item {
        display: block;
    }

    .ps-product--detail .ps-product__variations {
        margin-bottom: 2rem;
    }

    .ps-product--detail .ps-product__variations figure {
        margin-bottom: 15px;
    }

    .ps-product--detail .ps-product__variations figure figcaption {
        margin-bottom: 15px;
        font-size: 14px;
        color: #666;
        font-weight: 400;
    }

    .ps-product--detail .ps-product__variations figure figcaption strong {
        color: #000;
    }

    .ps-product--detail .ps-product__progress-bar {
        display: block;
        width: 100%;
    }

    .ps-product--detail .ps-product__progress-bar .ps-progress__value {
        margin-bottom: 5px;
        position: relative;
        display: block;
        height: 20px;
        background-color: #e4e4e4;
    }

    .ps-product--detail .ps-product__progress-bar .ps-progress__value > span {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        right: 0;
        height: 100%;
        background-color: #6ab9b7;
        width: 50%;
    }

    .ps-product--detail .ps-product__progress-bar p {
        margin-bottom: 0;
    }

    .ps-product--detail .ps-product__progress-bar p > b {
        color: #690;
    }

    .ps-product--detail .ps-product__countdown {
        margin-bottom: 25px;
        padding: 20px;
        background-color: #f4f4f4;
    }

    .ps-product--detail .ps-product__countdown figure {
        display: flex;
        margin-bottom: 20px;
    }

    .ps-product--detail .ps-product__countdown figure > * {
        width: 100%;
    }

    .ps-product--detail .ps-product__countdown figure figcaption {
        max-width: 260px;
        font-size: 16px;
        font-weight: 600;
        text-transform: uppercase;
        color: #000;
        padding-right: 20px;
    }

    .ps-product--detail .ps-product__countdown .ps-countdown li {
        position: relative;
        display: inline-block;
        padding-right: 20px;
        margin-right: 10px;
        text-align: center;
    }

    .ps-product--detail .ps-product__countdown .ps-countdown li:after {
        content: ':';
        color: #666;
        font-size: 20px;
        position: absolute;
        top: 20px;
        left: 0;
        font-weight: 600;
    }

    .ps-product--detail .ps-product__countdown .ps-countdown li span {
        display: flex;
        margin-bottom: 10px;
        justify-content: center;
        align-items: center;
        width: 56px;
        height: 56px;
        background-color: #ffffff;
        border: 1px solid #ccc;
        font-size: 30px;
        color: red;
        font-weight: 600;
    }

    .ps-product--detail .ps-product__countdown .ps-countdown li p {
        margin-bottom: 0;
    }

    .ps-product--detail .ps-product__countdown .ps-countdown li:last-child {
        margin-right: 0;
    }

    .ps-product--detail .ps-product__countdown .ps-countdown li:last-child:after {
        display: none;
    }

    .ps-product--detail .ps-product__thumbnail {
        width: 100%;
        display: flex;
        flex-flow: row-reverse nowrap;
        align-content: flex-start;
    }

    .ps-product--detail .ps-product__thumbnail > * {
        width: 100%;
    }

    .ps-product--detail .ps-product__thumbnail .ps-product__badge {
        width: auto;
    }

    .ps-product--detail .ps-product__thumbnail figure {
        position: relative;
        display: block;
        max-width: calc(100% - 60px);
        padding-left: 10px;
    }

    .ps-product--detail .ps-product__thumbnail .ps-product__variants {
        max-width: 60px;
        width: 100%;
        min-width: 60px;
        margin-left: 10px;
    }

    .ps-product--detail .ps-product__thumbnail .ps-product__video {
        position: absolute;
        bottom: 20px;
        left: 20px;
        z-index: 20;
    }

    .ps-product--detail .ps-product__thumbnail .ps-wrapper {
        position: relative;
        box-shadow: 6px 0 10px 2px #eee;
    }

    .ps-product--detail .ps-product__heading {
        margin-bottom: 40px;
        margin-top: 10px;
        padding-bottom: 15px;
        font-size: 20px;
        font-weight: 600;
        line-height: 1;
        border-bottom: 1px solid #e1e1e1;
    }

    .ps-product--detail .ps-product__thumbnail[data-vertical='false'] {
        flex-flow: row wrap;
    }

    .ps-product--detail .ps-product__thumbnail[data-vertical='false'] figure {
        max-width: 100%;
        padding-left: 0;
    }

    .ps-product--detail .ps-product__thumbnail[data-vertical='false'] .ps-product__variants {
        max-width: 100%;
        text-align: center;
        width: 100%;
    }

    .ps-product--detail .ps-product__thumbnail[data-vertical='false'] .ps-product__variants .item {
        margin-bottom: 0;
        margin-right: 10px;
    }

    .ps-product--detail .ps-product__thumbnail[data-vertical='false'] .ps-product__gallery {
        margin-bottom: 10px;
    }

    .ps-product--detail .ps-product__thumbnail[data-vertical='false'] .ps-product__gallery img {
        width: 100%;
    }

    .ps-product--detail .ps-product__header {
        display: flex;
        flex-flow: row nowrap;
        background: #fff;
        padding: 10px;
        border-radius: 10px;
        box-shadow: 0 0 10px #eee;
    }

    .ps-product--detail .ps-product__header > * {
        width: 100%;
    }

    .ps-product--detail .ps-product__header .ps-product__thumbnail {
        max-width: 43%;
    }

    .ps-product--detail .ps-product__header .ps-product__info {
        max-width: 54%;
        padding: 0px 0px 0 9px;
        margin-top: 17px;
        overflow: auto;
        max-height: calc(100% - 5.5rem);
        margin-right: 15px;
    }

    .ps-product--detail > .ps-product__content {
        background: #fff;
        margin: 20px 0;
        border-radius: 10px;
        box-shadow: 0 0 10px #eee;
    }

    .ps-product--detail .ps-tab-list {
        position: relative;
        display: block;
        padding-left: 0;
        border-bottom: 1px solid #e1e1e1;
    }

    .ps-product--detail .ps-tab-list li {
        display: inline-block;
    }

    .ps-product--detail .ps-tab-list li a {
        position: relative;
        display: block;
        color: #999999;
        font-size: 20px;
        padding: 15px 20px;
        line-height: 20px;
        font-weight: 600;
    }

    .ps-product--detail .ps-tab-list li a:before {
        content: '';
        position: absolute;
        top: 100%;
        right: 0;
        width: 100%;
        height: 3px;
        background-color: #6ab9b7;
        transform: scale3d(0, 1, 1);
        transform-origin: 100% 50%;
        transition: transform 0.75s cubic-bezier(0.77, 0, 0.175, 1);
    }

    .ps-product--detail .ps-tab-list li a:hover {
        color: #000;
    }

    .ps-product--detail .ps-tab-list li a:hover:before {
        transform: scale3d(1, 1, 1);
        transform-origin: 0 50%;
    }

    .ps-product--detail .ps-tab-list li:last-child {
        margin-right: 0;
    }

    .ps-product--detail .ps-tab-list li.active a {
        color: #000;
        border-color: #000;
    }

    .ps-product--detail .ps-tab-list li.active a:before {
        transform: scale3d(1, 1, 1);
        transform-origin: 0 50%;
    }

    .ps-product--detail .ps-tab p {
        margin-bottom: 25px;
    }

    .ps-product--detail .ps-product .ps-product__price {
        font-size: 16px;
        font-weight: 400;
    }

    .ps-product--detail.ps-product--thumbnail-right .ps-product__thumbnail {
        flex-flow: row nowrap;
    }

    .ps-product--detail.ps-product--thumbnail-right .ps-product__thumbnail figure {
        padding-left: 0;
        padding-right: 10px;
    }

    .ps-tab {
        display: none;
        padding: 20px;
    }

    .ps-tab.active {
        display: block;
    }

    .product-image{
        width: 489px;
        height: 489px;
        border-radius: 5px;
        border: 1px solid #ddd;
    }
    .product-attr {font-size: 14px;padding: 0 50px;}

    .product-attr-row {
        padding: 15px 0px;
        border-bottom: 1px solid #ddd;
    }
    
    .product-attr-option {
        color: #000;
        display: flex;
        align-items: center;
        font-weight: 200;
    }

    .product-attr-name {
        padding: 0 11px 0 0;
        display: flex;
        align-items: center;
        font-weight: 600;
    }

    .lg-backdrop {
        z-index: 10001;
    }

    .lg-outer {
        z-index: 10002;
        text-align: right;
    }

</style>
