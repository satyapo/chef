if node['platform'] == 'ubuntu'

package 'tomcat7' do
  action :install
end

remote_file '/var/lib/tomcat7/webapps/benefits.war' do
  source 'https://s3-us-west-2.amazonaws.com/satyabog/softwares/benefits.war'
  owner 'tomcat7'
  group 'tomcat7'
  mode '0755'
  action :create
end

else

##RHEL 7
package 'tomcat' do
  action :install
end

service 'tomcat' do
  action :start
end

remote_file '/usr/share/tomcat/webapps/benefits.war' do
  source 'https://s3-us-west-2.amazonaws.com/satyabog/softwares/benefits.war'
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  action :create
end
end
