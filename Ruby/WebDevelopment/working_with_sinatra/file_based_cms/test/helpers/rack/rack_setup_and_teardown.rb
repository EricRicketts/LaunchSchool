module RackSetupAndTeardown
  attr_reader :home_page, :dir, :fnames, :dir_test, :password

  def app
    Sinatra::Application
  end

  def session
    last_request.env['rack.session']
  end

  def setup
    @password = 'secret'
    @home_page = '/'
    @fnames = %w[foo.txt foo.md]
    @dir = data_path
    fnames.each { |fname| FileUtils.mkdir_p(data_path) }
    fnames.each do |fname|
      File.open(dir + "/#{fname}", "w+") do |f|
        if fname == 'foo.txt'
          f.puts 'First line of foo.txt'
          f.puts 'This is the second line in foo.txt which is a text file.'
        else
          f.puts '# Foo'
          f.puts 'This is a paragraph in foo.md which is a markdown file.'
        end
      end
    end
    @dir_test = File.expand_path("../../../", __FILE__)
    File.open(dir_test + '/users.yml', "w+") do |f|
      admin_password = BCrypt::Password.create(password)
      f.puts ({ 'admin' => admin_password.to_s }.to_yaml)
    end
  end

  def admin_session
    { 'rack.session' => { username: 'admin', password: password } }
  end

  def teardown
    FileUtils.rm_rf(data_path)
    FileUtils.remove_file(dir_test + "/users.yml")
  end
end
