<style>
    .chat-tools {
        display: none;
        margin: 15px 15px 0 15px;
        justify-content: space-evenly;
    }

    .user-chat-item {
        padding: 15px !important;
        border-top: 1px solid #ddd;

    }

    .user-chat-item:hover {
        background: #eef1f5;
    }

    .user-chat-item:hover > .chat-tools {
        display: flex;
    }

    .hidden {
        display: none;
    }

    .unread {
        font-weight: 900;
        background: #d4e8fd;
    }

    .message-text {
        width: fit-content;
        clear: both;
        display: contents;
    }

    .card-body {
        padding: 0;
    }
    .direct-chat-msg {
        text-align: right;
    }
    .user_time {
        margin-left: 40px;
    }
</style>
