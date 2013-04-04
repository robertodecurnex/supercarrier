class Supercarrier
  
  class ProjectsProxy

    # Returns the project repository for the given name.
    #
    # @param [String] name the identifier of the target project.
    # @return [Supercarrier::Project] the target project.
    def self.[] name
      Supercarrier.get_project(name)
    end

    # Adds a new project, cloning the given project repository into the .projects directory.
    #
    # @param [Hash] params a hash containing, at least, :name and :uri
    # @return [Supercarrier::ProjectsProxy] the projects proxy. 
    def self.<< params
      raise MissingParameters, ':name and :uri are both required parameters.' if (params[:name].nil? || params[:uri].nil?)

      Supercarrier.add_project(params[:uri], params[:name])

      Supercarrier.projects
    end

  end

end
