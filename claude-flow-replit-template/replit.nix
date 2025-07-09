{ pkgs }: {
  deps = [
    pkgs.nodejs-20_x
    pkgs.python310Full
    pkgs.python310Packages.pip
    pkgs.python310Packages.setuptools
    pkgs.python310Packages.wheel
    pkgs.python310Packages.debugpy
    pkgs.python310Packages.pylint
    pkgs.python310Packages.black
    pkgs.python310Packages.autopep8
    pkgs.python310Packages.requests
    pkgs.python310Packages.flask
    pkgs.python310Packages.fastapi
    pkgs.python310Packages.uvicorn
    pkgs.nodePackages.typescript-language-server
    pkgs.nodePackages.vscode-langservers-extracted
    pkgs.nodePackages.typescript
    pkgs.nodePackages.npm
    pkgs.nodePackages.nodemon
    pkgs.git
    pkgs.curl
    pkgs.wget
    pkgs.gcc
    pkgs.gnumake
    pkgs.sqlite
    pkgs.tree
    pkgs.jq
    pkgs.yq
  ];
  
  env = {
    PYTHON_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
      pkgs.glib
      pkgs.libffi
    ];
    PYTHONBIN = "${pkgs.python310Full}/bin/python3";
    LANG = "en_US.UTF-8";
    STDERRED_ESC_SEQUENCE = "";
    PYTHONPATH = "/home/runner/$REPL_SLUG:$PYTHONPATH";
    NODE_PATH = "/home/runner/$REPL_SLUG/node_modules";
  };
}