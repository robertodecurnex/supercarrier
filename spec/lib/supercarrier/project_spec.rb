require_relative '../../support/spec_helper.rb'

describe Supercarrier::Project do
   
  describe '#add_remote' do
    
    before :each do
      Supercarrier.add_project('https://github.com/robertodecurnex/J50Npi.git', 'test')
    end

    let :project do
      Supercarrier::Project.open('test')
    end

    let :remotes do
      project.add_remote('git@heroku.com:heroku-dummy-app.git', 'production')
    end

    it 'should return a Supercarrier::RemotesProxy instance' do
      remotes.should be_instance_of Supercarrier::RemoteProxy
    end

    it 'should add the given repo URI as the "production" remote source' do
      remotes['poduction'].uri.should == 'git@heroku.com:heroku-dummy-app.git'
    end

  end
  
  describe '#push' do
   
    before :each do
      Supercarrier.add_project('https://github.com/robertodecurnex/heroku_dummy_app.git', 'dummy')
    end

    let :project do
      Supercarrier.get_project('dummy')
    end
    
    it 'push the code to Heroku' do
    end

  end
  
  describe '::open' do

    before :each do
      Supercarrier.add_project('https://github.com/robertodecurnex/J50Npi.git', 'test')
    end

    let :project do
      Supercarrier::Project.open('test')
    end

    it 'should return a Supercarrier::Project instance named "test"' do
      project.should be_instance_of Supercarrier::Project

      project.name.should == 'test'
    end

  end

end
