# syslog-provisioning

## Installation (example)

To embed a git commit hash and git repository name (origin), please edit `knife[:before_converge]` in *.chef/knife.rb* like below.

```
knife[:before_converge]  = %Q{
  berks vendor vendor/cookbooks &&
  echo "normal['syslog-provisioning']['git_hash'] = '$(git log -1 --pretty=format:%H)'"    | tee    cookbooks/base/attributes/syslog-provisioning_tmp.rb
  echo "normal['syslog-provisioning']['git_repo'] = '$(git remote get-url --push origin)'" | tee -a cookbooks/base/attributes/syslog-provisioning_tmp.rb
}
```

Then, add 'include_recipe' to cookbooks/base/recipes/default.rb.

```
include_recipe 'syslog-provisioning'
```

`cookbooks/base/attributes/syslog-provisioning_tmp.rb` is not need to be version controlled. it can be ignored by `.gitignore`.

### Notice

If your receipes dont't have ***base*** cookbooks, please find one corresponded to.

## Special Thanks!!!

@sawanoboly
