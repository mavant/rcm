  $ . "$TESTDIR/helper.sh"

Using EXCLUDES in rcrc should be equivalent to excluding items with with -x

  $ touch .dotfiles/example
  > touch .dotfiles/excluded1
  > echo 'EXCLUDES="excluded1"' > $HOME/.rcrc

  $ lsrc
  /*/.dotfiles/example (glob)

Should handle multiple excluded files

  $ touch .dotfiles/example
  > touch .dotfiles/excluded1
  > touch .dotfiles/excluded2
  > echo 'EXCLUDES="excluded1 excluded2"' > $HOME/.rcrc

  $ lsrc
  /*/.dotfiles/example (glob)

Should handle excludes with globs

  $ touch .dotfiles/example
  > touch .dotfiles/excluded1
  > touch .dotfiles/excluded2
  > echo 'EXCLUDES="excluded*"' > $HOME/.rcrc

  $ lsrc
  /*/.dotfiles/example (glob)

Should accept directory:file syntax

  $ mkdir .dotfiles/partial
  > touch .dotfiles/partial/included
  > touch .dotfiles/partial/excluded1
  > echo 'EXCLUDES="excluded1 excluded2 .dotfiles/partial/excluded1"' > $HOME/.rcrc

  $ lsrc
  /*/.dotfiles/example (glob)
  /*/.dotfiles/partial/included (glob)
