maintainer       "Vasily Mikhaylichenko"
maintainer_email "vasily@locomote.com"
license          "BSD"
description      "Git user configuration"
version          "0.1"

%w{redhat centos}.each do |os|
  supports os
end

%w{user git ssh_known_hosts}.each do |d|
  depends d
end
