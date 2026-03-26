FROM node:20

# Timezone
ARG TZ=Europe/Berlin
ENV TZ=${TZ} \
    DEVCONTAINER=true

# System Tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    gh \
    vim \
    nano \
    curl \
    wget \
    sudo \
    less \
    jq \
    procps \
    openssh-client \
    python3 \
    python3-pip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Hugo Extended
ARG HUGO_VERSION=0.159.0
RUN curl -sL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" \
    | tar -xz -C /usr/local/bin hugo

# git-delta (schönere Diffs)
ARG GIT_DELTA_VERSION=0.18.2
RUN ARCH=$(dpkg --print-architecture) && \
    wget -q "https://github.com/dandavison/delta/releases/download/${GIT_DELTA_VERSION}/git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb" && \
    dpkg -i "git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb" && \
    rm "git-delta_${GIT_DELTA_VERSION}_${ARCH}.deb"

# User Setup (Security: non-root)
RUN usermod -s /bin/bash node \
    && mkdir -p /workspace /home/node/.claude /home/node/.npm /commandhistory /home/node/.npm-global \
    && chown -R node:node /workspace /home/node /commandhistory

# npm global prefix auf user-eigenes Verzeichnis → Claude Code kann sich selbst updaten
USER node
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH="/home/node/.npm-global/bin:$PATH"
RUN npm install -g @anthropic-ai/claude-code

# Working Directory
WORKDIR /workspace

# Bash History Persistence
ENV HISTFILE=/commandhistory/.bash_history

CMD ["/bin/bash"]
