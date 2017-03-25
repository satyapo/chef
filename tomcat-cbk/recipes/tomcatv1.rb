filesource="https://s3-us-west-2.amazonaws.com/satyabog/softwares/benefits.war"
if node['platform'] == 'ubuntu'
p_name="tomcat7"
else
p_name="tomcat"
end

package p_name do
  action :install
end

if p_name=="tomcat7"
remote_file '/var/lib/tomcat7/webapps/benefits.war' do
  source filesource
  owner 'tomcat7'
  group 'tomcat7'
  mode '0755'
  action :create
end

else

##RHEL 7
service 'tomcat' do
  action :start
end

remote_file '/usr/share/tomcat/webapps/benefits.war' do
  source filesource
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  action :create
end
end
