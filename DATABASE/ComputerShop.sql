# create table brands
# (
#     id   bigint auto_increment primary key,
#     name varchar(255) null,
#     slug varchar(255) null
# );
#
# create table categories
# (
#     id          bigint auto_increment primary key,
#     description longtext     null,
#     display     varchar(255) null,
#     menuOrder   int          not null,
#     name        varchar(255) null,
#     updated     datetime default null,
#     slug        varchar(255) null,
#     parent_id   bigint       null,
#     constraint FKsaok720gsu4u2wrgbk10b5n8d
#         foreign key (parent_id) references categories (id)
#
# );
#
# create table contacts
# (
#     id      bigint auto_increment
#         primary key,
#     email   varchar(255) null,
#     message varchar(255) null,
#     name    varchar(255) null,
#     subject varchar(255) null
# );
#
# create table email_subscriber
# (
#     id         bigint auto_increment
#         primary key,
#     email      varchar(255) null,
#     first_name varchar(255) null,
#     last_name  varchar(255) null
# );
#
# create table image_gallery
# (
#     id    bigint auto_increment
#         primary key,
#     image longblob null
# );
#
# create table types
# (
#     id          bigint auto_increment
#         primary key,
#     name        varchar(255) null,
#     category_id bigint       null,
#     constraint FK19pulryxwu6gvxoy9dpv3mltk
#         foreign key (category_id) references categories (id)
# );
#
# # create table products
# # (
# #     id                 bigint auto_increment primary key,
# #     name               varchar(255) null,
# #     slug               varchar(255) null,
# #     type               varchar(255) null,
# #     status             varchar(255) null,
# #     featured           bit          not null,
# #     catalog_visibility varchar(255) null,
# #     description        longtext     null,
# #     short_description  varchar(255) null,
# #     sku                varchar(255) null,
# #     price              double       not null,
# #     regular_price      double       not null,
# #     sale_price         double       not null,
# #     purchasable        bit          not null,
# #     on_sale             bit          not null,
# #     stock_quantity     int          not null,
# #     weight             varchar(255) null,
# #     sold_individually  bit          not null,
# #     average_rating     varchar(255) null,
# #     rating_count       int          null,
# #     stock_status     varchar(255) null,
# #     reviews_allowed  bit          not null,
# #     updated            datetime default null,
# #     brand_id           bigint       null,
# #     category_id        bigint       null,
# #     constraint FKa3a4mpsfdf4d2y6r8ra3sc8mv
# #         foreign key (brand_id) references brands (id),
# #     constraint FKog2rp4qthbtt2lfyhfo32lsw9
# #         foreign key (category_id) references categories (id)
# # );
#
# create table cart_item
# (
#     id               bigint auto_increment
#         primary key,
#     selling_quantity int    not null,
#     total_price      double not null,
#     product_id       bigint null,
#     constraint FKqkqmvkmbtiaqn2nfqf25ymfs2
#         foreign key (product_id) references products (id)
# );
#
# create table products_images
# (
#     product_id bigint not null,
#     images_id  bigint not null,
#     constraint UK_68u3rm4tfmsixwa8nyfjg36xa
#         unique (images_id),
#     constraint FKc8bvmv9uah6x8acrdhr35fpwf
#         foreign key (images_id) references image_gallery (id),
#     constraint FKgt41wyswrex82sy6iwdup2eak
#         foreign key (product_id) references products (id)
# );
#
# create table users
# (
#     id       bigint auto_increment
#         primary key,
#     email    varchar(255) null,
#     enabled  bit          not null,
#     password varchar(255) null,
#     role     varchar(255) null,
#     username varchar(255) null
# );
#
# create table customers
# (
#     id         bigint auto_increment
#         primary key,
#     address    varchar(255) null,
#     first_name varchar(255) null,
#     last_name  varchar(255) null,
#     phone      varchar(255) null,
#     user_id    bigint       null,
#     constraint FKrh1g1a20omjmn6kurd35o3eit
#         foreign key (user_id) references users (id)
# );
#
# create table customer_order
# (
#     id                       bigint auto_increment
#         primary key,
#     deliver_customer_address varchar(255) null,
#     deliver_customer_name    varchar(255) null,
#     deliver_customer_phone   varchar(255) null,
#     order_date               datetime     null,
#     status                   bit          not null,
#     total_price              double       not null,
#     customer_id              bigint       null,
#     constraint FKs1hhpyc01pwovjdkl4n8bt240
#         foreign key (customer_id) references customers (id)
# );
#
# create table customer_order_cart_items
# (
#     customer_order_id bigint not null,
#     cart_items_id     bigint not null,
#     constraint UK_athq3it89gyc90qtbw2whlvl0
#         unique (cart_items_id),
#     constraint FKf34ukr2paewcb2sufcon3mvof
#         foreign key (cart_items_id) references cart_item (id),
#     constraint FKgydfteve08rmod7e46olshb41
#         foreign key (customer_order_id) references customer_order (id)
# );
#
# create table payments
# (
#     id                bigint auto_increment
#         primary key,
#     amount            double       not null,
#     payment_date      datetime     null,
#     payment_method    varchar(255) null,
#     status            bit          not null,
#     customer_order_id bigint       null,
#     constraint FKlr0ush2mo4iqbbfosl6vx6yo9
#         foreign key (customer_order_id) references customer_order (id)
# );
#
# create table rates
# (
#     id          bigint auto_increment
#         primary key,
#     review      varchar(255) null,
#     star_number int          not null,
#     customer_id bigint       null,
#     product_id  bigint       null,
#     constraint FK4mdsmkrr7od84tpgxto2v3t2e
#         foreign key (product_id) references products (id),
#     constraint FKrc2rrqf6sx1cc21e9yuyduf4d
#         foreign key (customer_id) references customers (id)
# );
#
# create table reset_password
# (
#     id          bigint auto_increment
#         primary key,
#     reset_token varchar(255) null,
#     user_id     bigint       null,
#     constraint FKnn31vah8aab9hd92x70pgdsbh
#         foreign key (user_id) references users (id)
# );
#
#
