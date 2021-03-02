# syslog-provisioning

## Installation

To embed a git commit hash and git repository name (origin), please edit `knife[:before_converge]` in *.chef/knife.rb* like below.

```
knife[:before_converge]  = %Q{
  berks vendor vendor/cookbooks &&
  echo "normal['syslog-provisioning']['git_hash']  = '$(git log -1 --pretty=format:%H)'"    | tee    cookbooks/base/attributes/syslog-provisioning_tmp.rb
  echo "normal['syslog-provisioning']['git_repo'] = '$(git remote get-url --push origin)'" | tee -a cookbooks/base/attributes/syslog-provisioning_tmp.rb
}
```

## Special Thanks!!!

@sawanoboly
