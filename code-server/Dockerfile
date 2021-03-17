FROM linuxserver/code-server

 
RUN code-server --install-extension bungcip.better-toml && \
    code-server --install-extension yzhang.markdown-all-in-one && \

    code-server --install-extension ms-azuretools.vscode-docker && \

    code-server --install-extension ryu1kn.partial-diff  && \
    code-server --install-extension eamodio.gitlens  && \
    code-server --install-extension mjmcloug.vscode-elixir && \
    ln -s  ~/.local/share/code-server/extensions /config/extensions 
#    code-server --install-extension ms-vscode-remote.remote-containers && \
    #    code-server --install-extension efanzh.graphviz-preview && \
    #    code-server --install-extension jakebecker.elixir-ls && \