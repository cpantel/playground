# [~/.gitconfig]
# lol = log --graph --decorate --pretty=oneline --abbrev-commit
# lola = log --graph --decorate --pretty=oneline --abbrev-commit --all 
#
# http://blog.kfish.org/2010/04/git-lola.html



git log --graph --decorate \
--pretty=format:"%Cgreen %ci %Cred %d %Cblue %h %Creset %s"
