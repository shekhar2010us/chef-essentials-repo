package 'tree' do
  action :install
end

template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
  owner 'root'
  group 'root'
end

cookbook_file '/etc/motd2' do
  source 'motd.file'
end

remote_file '/etc/motd3' do
  source 'https://docs.chef.io/resource_remote_file.html'
end


