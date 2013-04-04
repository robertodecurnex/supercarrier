require_relative '../support/spec_helper'

describe Supercarrier  do

  describe '::add_project' do

    let :project do
      Supercarrier.add_project('https://github.com/robertodecurnex/J50Npi.git', 'test')
    end

    it 'should clone the project to the .projects folder'do
      File.directory?(".projects/#{project.name}").should be_true
    end

    it 'should return a Supercarrier::Project instance named "test"' do
      project.should be_instance_of Supercarrier::Project

      project.name.should == 'test'
    end

  end

  describe '::get_project' do

    before :each do
      Supercarrier.add_project('https://github.com/robertodecurnex/J50Npi.git', 'test')
    end

    let :project do
      Supercarrier.get_project('test')
    end

    it 'should return a Supercarrier::Project instance named "test"' do
      project.should be_instance_of Supercarrier::Project

      project.name.should == 'test'
    end

  end
  
  describe '::projects' do
    
    before :each do
      Supercarrier.add_project('https://github.com/robertodecurnex/J50Npi.git', 'test')
    end
    
    let :projects do
      Supercarrier.projects
    end

    it 'should returna  Suppercarrier::ProjectsProxy instance' do
      projects.should equal Supercarrier::ProjectsProxy
    end

  end

end
