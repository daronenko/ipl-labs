# frozen_string_literal: true

require 'net/http'

XML_SERVER = 'http://localhost:3000/?format=xml'
XSL_LINK = "\n<?xml-stylesheet href=\"/visualizer.xsl\" type=\"text/xsl\"?>\n"
XSLT = Nokogiri::XSLT(File.read('public/visualizer.xsl').gsub(%r{<rm>(.*)</rm>}, '<rm>server-side</rm>'))

class IndexController < ApplicationController
  def input; end

  def get_xml(array)
    uri = URI(XML_SERVER)
    uri.query = URI.encode_www_form({ array: array })
    Net::HTTP.get_response(uri)
  end

  def render_server(xml)
    # rubocop:disable Rails/OutputSafety
    XSLT.transform(Nokogiri::XML(xml))
        .to_s
        .html_safe
    # rubocop:enable Rails/OutputSafety
  end

  def output
    xml = get_xml(params[:array]).body
    puts xml
    respond_to do |format|
      format.html { render html: render_server(xml) }
    end
  end
end
