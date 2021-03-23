require 'spec_helper'
require 'trix/simple_form/trix_editor_input'

describe Trix::SimpleForm::TrixEditorInput, type: :view do
  include SimpleFormSpecHelper

  let(:post) { mock_model('Post', body: 'My super awesome post content.') }

  let(:form) do
    simple_form_for(post, url: 'some-url') do |f|
      f.input(:body, as: :trix_editor)
    end
  end

  before { concat(form) }

  it 'outputs HTML containing the hidden input field' do
    assert_select format('input[type="hidden"][id="post_body"][value="%s"]', post.body)
  end

  it 'outputs HTML containing the trix editor tag' do
    assert_select 'trix-editor[input="post_body"]'
  end

  it 'outputs HTML containing the trix editor tag with a trix-content class' do
    assert_select 'trix-editor.trix-content'
  end

  context 'with custom input class' do
    let(:form) do
      simple_form_for(post, url: 'some-url') do |f|
        f.input(:body, as: :trix_editor, input: 'foo')
      end
    end

    it 'outputs HTML containing the trix editor tag with a custom input name' do
      assert_select 'trix-editor[input=foo]'
    end
  end

  context 'with custom data' do
    let(:form) do
      simple_form_for(post, url: 'some-url') do |f|
        f.input(:body, as: :trix_editor, data: { foo: 'bar' })
      end
    end

    it 'outputs HTML containing the trix editor tag with a custom data' do
      assert_select 'trix-editor[data-foo=bar]'
    end
  end

  context 'with custom toolbar' do
    let(:form) do
      simple_form_for(post, url: 'some-url') do |f|
        f.input(:body, as: :trix_editor, toolbar: 'my-custom-toolbar')
      end
    end

    it 'outputs the custom toolbar attribute' do
      assert_select 'trix-editor[toolbar="my-custom-toolbar"]'
    end
  end
end
