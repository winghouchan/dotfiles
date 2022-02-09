if status is-interactive
    # Set up Homebrew environment if Homebrew is installed but not set up
    if not command -v brew && test -x /opt/homebrew/bin/brew
        source (/opt/homebrew/bin/brew shellenv | psub)
    end

    # Install and run Fish package manager and plugins if not installed
    if not functions -q fisher
        curl -sL https://git.io/fisher | source; and fisher update
    end

    # Install Fast Node Manager if not installed
    if not command -v fnm
        curl -fsSL https://fnm.vercel.app/install | bash
    end
end

# Set Android environment variables
set --export ANDROID $HOME/Library/Android;
set --export ANDROID_HOME $ANDROID/sdk;
set --export ANDROID_SDK_ROOT $ANDROID/sdk;
