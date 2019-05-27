control 'MySQL' do

  describe package('mysql-server') do
    it { should be_installed }
  end

  describe service('mysql') do
    it {should be_enabled}
    it {should be_running}
  end

end
