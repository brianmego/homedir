local auto_session = require("auto-session")

auto_session.setup(
    {
        auto_restore_enabled = true,
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    }
)
