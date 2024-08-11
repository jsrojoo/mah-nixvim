[
  {
    event = "FileType";
    pattern = "help";
    command = "wincmd L";
  }

  {
    event = "FileType";
    pattern = [
      "markdown"
    ];
    command = "setlocal spell spelllang=en,fr";
  }
]
