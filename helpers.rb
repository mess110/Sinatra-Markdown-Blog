helpers do
  def to_css url
    '../styles/'.concat(url.join.chomp('.css')).to_sym
  end

  def read_markdown title
    path = "contents/" + title + ".md"
    RDiscount.new( File.open(path).read ).to_html
  end
end
