{ ... }:

{
  programs.git = {
    enable = true;
    userName = "deuzu";
    userEmail = "deuzu@localhost";
    # signing.key = "";
    # signing.signByDefault = true;
    ignores = [
      ".vscode/"
    ];
    extraConfig = {
      core = {
        autocrlf = "input";
        fileMode = false;
        editor = "vim";
      };
      init.defaultBranch = "main";
      push.default = "current";
      "remote \"origin\"" = {
        prune = true;
      };
      gpg.program = "gpg";
      color.ui = true;
      log.date = "relative";
      format.pretty = "format:%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s";
      "color \"diff-highlight\"" = {
        oldNormal = "red bold";
        oldHighlight = "red bold 52";
        newNormal = "green bold";
        newHighlight = "green bold 22";
      };
      "color \"diff\"" = {
        meta = "yellow";
        frag = "magenta bold";
        commit = "yellow bold";
        old = "red bold";
        new = "green bold";
        whitespace = "red reverse";
      };
      pager.diftool = true;
      "difftool \"difftastic\"" = {
        cmd = "difft \"$LOCAL\" \"$REMOTE\"";
      };
      diff = {
        tool = "difft";
      };
      merge.tool = "difft";
      difftool.prompt = false;
    };

    difftastic.enable = true;
    aliases = {
      f = "fetch";
      st = "status -sb";
      br = "branch";
      ci = "commit";
      cm = "commit -m";
      ame = "commit --amend";
      amn = "commit --amend --no-edit";
      co = "checkout";
      cp = "cherry-pick";
      rb = "rebase";
      rbc = "rebase --continue";
      rba = "rebase --abort";
      pu = "pull";
      pur = "pull --rebase";
      pop = "stash pop";
      lp = "log -p -M90%";
      lg = "log --pretty=oneline --abbrev-commit --graph --decorate";
      undo = "!git reset --soft HEAD^";
      p = "push";
      pf = "push --force-with-lease";
      ignore = "update-index --assume-unchanged";
      unignore = "update-index --no-assume-unchanged";
      ignored = "!git ls-files -v | grep \"^[[:lower:]]\"";
      dft = "difftool";
      dlog = "!f() { : git log ; GIT_EXTERNAL_DIFF=difft git log -p --ext-diff $@; }; f";
      squash-all = "!f(){ git reset $(git commit-tree HEAD^{tree} \"$@\");};f";
    };
  };
}
