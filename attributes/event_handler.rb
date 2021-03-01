default['syslog-provisioning']['git_repo'] = `git remote get-url --push origin`.chomp
default['syslog-provisioning']['git_hash'] = `git log -1 --pretty=format:"%H"`.chomp
