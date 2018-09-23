require File.expand_path("../../lib/lumberjack.rb", __FILE__)
require 'stringio'
require 'fileutils'
require 'timecop'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

def tmp_dir
  File.expand_path("../tmp", __FILE__)
end

def create_tmp_dir
  FileUtils.rm_r(tmp_dir) if File.exist?(tmp_dir)
  FileUtils.mkdir_p(tmp_dir)
end

def delete_tmp_dir
  FileUtils.rm_r(tmp_dir)
end

def delete_tmp_files
  Dir.glob(File.join(tmp_dir, "*")) do |file|
    File.delete(file)
  end
end
