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

case node[:platform]
when "ubuntu", "debian"
  service "apache2" do
    action [:start, :enable]
  end
when "centos", "redhat", "amazon"
  service "httpd" do
    action [:start, :enable]
  end
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

