#
# Cookbook:: syslog-provisioning
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
require 'syslog'

tag      = node[:'syslog-provisioning'][:tag]

# Chef.event_handler 内では、node オブジェクトを呼ぶのがちょっと面倒なのでここで入れちゃう
git_repo = node[:'syslog-provisioning'][:git_repo]
git_hash = node[:'syslog-provisioning'][:git_hash]

# イベントタイプ一覧はこちら https://docs.chef.io/handlers/#event-types
Chef.event_handler do
  on :converge_start do |run_context|
    Syslog.open(tag) do |syslog|
      syslog.info("provisioning started repository:%s revision:%s", git_repo, git_hash)
    end
  end
end

Chef.event_handler do
  on :converge_complete do
    Syslog.open(tag) do |syslog|
      syslog.info("provisioning finished repository:%s revision:%s", git_repo, git_hash)
    end
  end
end

Chef.event_handler do
  # Failのときも一応syslogへ入れて、一旦終了したことを記録します
  on :converge_failed do
    Syslog.open(tag) do |syslog|
      syslog.info("provisioning finished repository:%s revision:%s", git_repo, git_hash)
    end
  end
end
