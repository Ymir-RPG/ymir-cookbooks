# Cookbook Name:: ymir
# Recipe:: default

package 'git' do
  action :install
end

package 'python-pip' do
  action :install
end

git "/ymir-api" do
  repository "https://github.com/Ymir-RPG/ymir-api.git"
  reference "master"
  action :sync
  user "root"
end

execute "install_python_dependencies" do
  command "pip install -r /ymir-api/requirements.txt"
end

# This is just for testing
execute "run_server" do
  command "nohup python /ymir-api/run.py &"
end
