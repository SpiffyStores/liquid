# frozen_string_literal: true

module Liquid
  class TemplateFactory
    def for(template_name)
      template = Template.new
      template.name = template_name
      template
    end
  end
end
