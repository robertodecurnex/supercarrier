require 'git'

require_relative 'supercarrier/project'
require_relative 'supercarrier/version'

class Supercarrier

  # Clones the given project repository into the .projects directory.
  #
  # @param [String] uri the targer project repository URI.
  # @param [String] name the identifier to be used for the given project repository.
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

end
