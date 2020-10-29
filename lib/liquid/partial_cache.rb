# frozen_string_literal: true

module Liquid
  class PartialCache
    def self.load(template_name, context:, parse_context:)
      cached_partials = (context.registers[:cached_partials] ||= {})
      cached = cached_partials[template_name]
      return cached if cached

      file_system = (context.registers[:file_system] ||= Liquid::Template.file_system)

      # make read_template_file call backwards-compatible.
      begin
      source      = file_system.read_template_file(template_name)
      rescue FileSystemError
        # Attempt to load from global directory
        source = Liquid::Template.file_system.read_template_file(template_name)
      end

      parse_context.partial = true

      template_factory = (context.registers[:template_factory] ||= Liquid::TemplateFactory.new)
      template = template_factory.for(template_name)

      partial = template.parse(source, parse_context)
      cached_partials[template_name] = partial
    ensure
      parse_context.partial = false
    end
  end
end
