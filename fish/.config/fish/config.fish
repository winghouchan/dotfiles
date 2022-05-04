if status is-interactive
    # Set up Homebrew environment if Homebrew is installed but not set up
    if ! command -v brew &> /dev/null && test -x /opt/homebrew/bin/brew
        /opt/homebrew/bin/brew shellenv | source
    end

    # Install and run Fish package manager and plugins if not installed
    if ! functions -q fisher
        curl -sL https://git.io/fisher | source && fisher update
    end

    # Install Fast Node Manager if not installed
    if ! command -v fnm &> /dev/null
        curl -fsSL https://fnm.vercel.app/install | bash
    end

    # Set up rbenv
    rbenv init - fish | source
end

# Set Android environment variables
set --export ANDROID $HOME/Library/Android;
set --export ANDROID_HOME $ANDROID/sdk;
set --export ANDROID_SDK_ROOT $ANDROID/sdk;
