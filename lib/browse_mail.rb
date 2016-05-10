require 'browse_mail/engine'

module BrowseMail
  mattr_accessor :preview_classes_path, :encrypt_url_params

  def find_preview_classes(dir)
    return [] unless File.directory?(dir)

    Dir.chdir(dir) do
      Dir['**/*_preview.rb'].map { |p| p.sub(/\.rb$/, '').camelize }
    end
  end

  def encrypted_url_params?
    encrypt_url_params
  end
end
