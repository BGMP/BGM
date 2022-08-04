module ProfilesHelper
  module Profile
    class << self
      def render(content)
        do_safe(do_sanitize(content))
      end

      def do_safe(content)
        content.html_safe
      end

      def do_sanitize(content)
        Sanitize.clean(content, Sanitize::Config::RELAXED)
      end
    end
  end
end
