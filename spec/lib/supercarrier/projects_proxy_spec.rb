require_relative '../../support/spec_helper.rb'

describe Supercarrier::ProjectsProxy do

  describe '::[]' do
   
    before :each do 
      Supercarrier.add_project(TEST_REPO_URI, 'test')  
    end 

    let :project do
      Supercarrier.projects['test']
    end

    it 'should return a Supercarrier::Project instance named "test"' do
      project.should be_instance_of Supercarrier::Project

      project.name.should == 'test'
    end

  end

  describe '::<<' do
   
    let :projects do
      Supercarrier.projects << {uri:TEST_REPO_URI, name:'test'}
    end

    let :project do
      projects['test']
    end

    it 'should return the Supercarrier::ProjectsProxy class' do
      projects.should equal Supercarrier::ProjectsProxy
    end

    it 'should add the "test" project to the projects list' do
      project.should be_instance_of Supercarrier::Project

      project.name.should == 'test'
    end
    
  end

end
