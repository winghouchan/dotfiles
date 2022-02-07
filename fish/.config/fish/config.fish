if status is-interactive
    # Install and run Fish package manager if not installed
    if not functions -q fisher
        curl -sL https://git.io/fisher | source; and fisher install jorgebucaran/fisher
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
