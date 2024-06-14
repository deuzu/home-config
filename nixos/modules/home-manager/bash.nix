{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "ls --color=auto";
      dir = "dir --color=auto";
      vdir = "vdir --color=auto";
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
      l = "ls -alh";
      d = "docker";
      dc = "docker compose";
      g = "git";
      k = "kubectl";
      tf = "terraform";
    };
  };
}
