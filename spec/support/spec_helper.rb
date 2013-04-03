require_relative '../../lib/supercarrier'

require 'rspec'

RSpec.configure do |config|

  # Clean the .projects directory after all the tests have run. 
  config.after :all do 
    
    Dir.foreach('.projects') do |item|
      next if item =~ /^\.(.|gitignore)?$/

      FileUtils.rm_rf(".projects/#{item}")
    end

  end

  # Clean the .projects directory before every test.
  config.before :each do

    Dir.foreach('.projects') do |item|
      next if item =~ /^\.(.|gitignore)?$/

      FileUtils.rm_rf(".projects/#{item}")
    end

  end

end

