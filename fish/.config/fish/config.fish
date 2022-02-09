if status is-interactive
    # Set up Homebrew environment if Homebrew is installed but not set up
    if ! command -v brew && test -x /opt/homebrew/bin/brew
        /opt/homebrew/bin/brew shellenv | source
    end

    # Install and run Fish package manager and plugins if not installed
    if ! functions -q fisher
        curl -sL https://git.io/fisher | source && fisher update
    end

    # Install Fast Node Manager if not installed
    if ! command -v fnm
        curl -fsSL https://fnm.vercel.app/install | bash
    end
end

# Set Android environment variables
set --export ANDROID $HOME/Library/Android;
set --export ANDROID_HOME $ANDROID/sdk;
set --export ANDROID_SDK_ROOT $ANDROID/sdk;
