require 'git'

require_relative 'supercarrier/project'
require_relative 'supercarrier/projects_proxy'
require_relative 'supercarrier/remote_proxy'
require_relative 'supercarrier/version'

class Supercarrier

  # Adds a new project, cloning the given project repository into the .projects directory.
  #
  # @param [String] uri the targer project repository URI.
  # @param [String] name the identifier to be used for the given project repository.
  # @return [Supercarrier::Project] the new project.
  def self.add_project(uri, name)
    Git.clone(uri, ".projects/#{name}")

    self.get_project(name)
  end

  # Opens the given project repository and returns its Supercarrier::Project representation.
  #
  # @param [String] name the name of the target project repository to open.
  # @return [Supercarrier::Project] the project representation of the target project repository.
  def self.get_project(name)
    Project.open(name)
  end

  # Returns a Supercarrier::ProjectsProxy instance.
  #
  # @return [Supercarrier::ProjectsProxy] a proxy to work over the <Project> instances
  def self.projects
    Supercarrier::ProjectsProxy
  end

end
