require File.expand_path('../../lib/redcarpet/variables/variables_renderer', __FILE__)

describe VariablesRenderer do
  before do
    data = { 'test_var_1' => 'value_var_1' }
    rndr = VariablesRenderer.new(data_source: data)
    @red = Redcarpet::Markdown.new(rndr, no_intra_emphasis: true)
  end

  describe "#preprocess" do
    before do
      @mdown  = File.read(File.expand_path('../support/test_doc_1.md', __FILE__))
      @result = File.read(File.expand_path('../support/result_doc_1.html', __FILE__))
    end

    it "should replace variables by their values" do
      @red.render(@mdown).should == @result
    end
  end
end
