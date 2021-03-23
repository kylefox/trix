module Trix
  module SimpleForm
    class TrixEditorInput < ::SimpleForm::Inputs::Base
      def input(_wrapper_options)
        trix_options = options.slice(:spellcheck, :toolbar, :tabindex, :input, :data)
        editor_options = { input: input_class, class: 'trix-content' }.merge(trix_options)

        editor_tag = template.content_tag('trix-editor', '', editor_options)
        hidden_field = @builder.hidden_field(attribute_name, input_html_options)

        template.content_tag('div', hidden_field + editor_tag, class: 'trix-editor-wrapper')
      end
    end
  end
end
