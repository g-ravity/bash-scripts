# To create BE PRs for develop
alias prdb="gh pr create -B @develop -r pranabs1ngh,anku255,neeraj0786 -l feat-\>develop"

# To create FE PRs for develop
alias prdf="gh pr create -B @develop -r pranabs1ngh,anku255,Bikashd4332 -l feat-\>develop"

# To create staging PRs
alias prs="gh pr create -B @staging -l feat-\>staging"

# To create Admin FE PRs for develop
alias prd="gh pr create -B @develop -r pranabs1ngh,anku255 -l feat-\>develop"

# To close all tabs in VSCode
alias ct="cliclick kd:ctrl,cmd t:k ku:cmd,ctrl"

# To split terminal in VSCode
alias split="cliclick kd:ctrl,shift t:5 ku:ctrl,shift"

# Shift focus between split terminals
alias focus:left="cliclick kd:cmd,alt kp:ar row-left ku:cmd,alt"
alias focus:right="cliclick kd:cmd,alt kp:arrow-right ku:cmd,alt"

# Start Minimal Admin
alias start:admin="kill-port 9096
kill-port 9097
split
cliclick t:cd kp:space t:~ kp:return
cliclick t:cd kp:space t:'Documents/YC/yc-admin- backend' kp:return
cliclick t:yarn kp:space t:start\:qa kp:return
focus:left
cliclick w:500
cliclick t:cd kp:space t:~ kp:return
cliclick t:cd kp:space t:Documents/YC/yc-admin-frontend kp:return
cliclick t:yarn kp:space t:start kp:return"