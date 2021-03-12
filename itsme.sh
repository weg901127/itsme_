#You must push '~/.ssh/id_rsa' on your private repo
id="YOUR GITHUB ID"
pw="YOUR GITHUB PW"
reponame="YOUR REPO NAME"
enter="\r"
mkdir -p ~/.ssh/
expect <<EOF
spawn git clone http://github.com/${id}/${reponame}.git $HOME/.ssh/vog
sleep 0.5
expect -re "Username"
send ${id}${enter}
expect -re "Password"
send ${pw}${enter}
interact
expect eof
EOF
chmod 400 $HOME/.ssh/vog/id_rsa
eval $(ssh-agent)
ssh-add $HOME/.ssh/vog/id_rsa
