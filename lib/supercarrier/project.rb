class Supercarrier

  class Project

    attr_reader :name

    def initialize(name, repository)
      @name = name
      @repository = repository
    end

    # Adds a remote source to the project repository.
    #
    # @param [String] uri the remote source uri.
    # @param [String] name the remote source name.
    # @return [Supercarirer::RemoteProxy] the remote proxy instance of the project.
    def add_remote(uri, name)
      @repository.add_remote(name,uri)
      
      self.remotes
    end

    # Returns a collection of the project remote sources.
    #
    # @return [Supercarrier::RemoteProxy] the remote proxy instance of the project.
    def remotes
      Supercarrier::RemoteProxy.new(@repository)
    end

    # Opens the given project repository and returns its Supercarrier::Project representation.
    #
    # @param [String] name the name of the target project repository to open.
    # @return [Supercarrier::Project] the project representation of the target project repository.
    def self.open(name)
      project_repository = Git.open(".projects/#{name}")

      Project.new(name, project_repository)
    end

  end

end
