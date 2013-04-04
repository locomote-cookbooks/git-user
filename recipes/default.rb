include_recipe 'user::data_bag'

node['git-user']['known_hosts'].each do |h|
  ssh_known_hosts_entry h
end

node['git-user']['users'].each_pair do |username, config|
  user = data_bag_item('users', username)

  if user['ssh_private_key']
    file "#{user['home']}/.ssh/id_rsa" do
      content user['ssh_private_key']
      mode '0600'
      owner username
      group username
    end
  end

  template "#{user['home']}/.gitconfig" do
    source 'gitconfig.erb'
    mode '0644'

    variables(
      :name  => config['name'],
      :email => config['email']
    )
  end
end
