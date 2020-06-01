require "test_helper"

class TestResolve < Test::Unit::TestCase
  def setup
    @env = Sprockets::Environment.new(File.expand_path(File.dirname(__FILE__)))
    @env.append_path("fixtures/javascripts")
  end

  def test_resolve_eco_jst_from_coffeescript
    content_type = content_type_for("view.coffee")

    uri, _ = @env.resolve!("template", accept: content_type)
    assert_equal "template.jst.eco", File.basename(URI(uri).path)
  end

  private

  def content_type_for(path)
    if Gem::Version.new(Sprockets::VERSION) >= Gem::Version.new("4.0")
      if ret = @env.send(:match_path_extname, path, @env.config[:mime_exts])
        return ret[1]
      end
    else
      if ret = @env.send(:parse_path_extnames, path)
        return ret[1]
      end
    end

    nil
  end
end
