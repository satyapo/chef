package 'httpd' do
	action :install
end
service 'httpd' do
        action :start
end
file '/var/www/html/index.html' do
  content '<html>This is a Demo page.</html>'
  mode '0755'
  owner 'root'
  group 'root'
end
