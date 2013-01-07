require_relative 'rjson/parser.rb'
require_relative 'rjson/tokenizer'
require 'stringio'
require 'strscan'

module RJSON
  def self.load_io(input)
    tok     = RJSON::Tokenizer.new input
    parser  = RJSON::Parser.new tok
    handler = parser.parse
    handler.result
  end

  def self.load(json)
    load_io StringIO.new json
  end
end