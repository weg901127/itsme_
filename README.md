# 용도

- 과카몰리 접속시 ssh public key를 항상 등록해줘야하는 번거로움을 해결해준다..

# 사용법

- /User/(YOUR_ID)/.ssh/id_rsa.pub을 intranet에 등록한다
- 해당 자리에서 /User/(YOUR_ID)/.ssh/id_rsa를 개인 github에 업로드한다.....❤️

```bash
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
```

- 위의 소스코드를 수정한다(YOUR GITHUB ID, YOUR GITHUB PW, YOUR REPO NAME)
- 여기에서 YOUR REPO NAME 부분은 위 과정에서 ❤️ 부분의 REPO NAME으로 바꿔준다..
- 이제 만약 과카몰리 로그인시에 key 인증을 요구하면 해당 쉘을 실행하면된다...