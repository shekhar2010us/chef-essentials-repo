package 'apache2'

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

service 'apache2' do
  action [:enable, :start]
end
