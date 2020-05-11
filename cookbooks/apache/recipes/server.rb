case node[:platform]
when "ubuntu", "debian"
  package "apache2" do
    action :install
  end
when "centos", "redhat", "amazon"
  package "httpd" do
    action :install
  end
end

service 'apache2' do
  case node[:platform]
  when 'redhat', 'centos', 'amazon'
    service_name 'httpd'
  when 'debian', 'ubuntu'
    service_name 'apache2'
  end
  action [:start, :enable]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

