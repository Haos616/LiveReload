assert = require 'assert'
Path   = require 'path'
wrap   = require '../wrap'

LRPlugin = require '../../lib/plugins/plugin'
{ LRPluginsRoot } = require '../helper'


describe "LRPlugin for SASS", ->

  beforeEach wrap (done) ->
    @plugin = new LRPlugin(Path.join(LRPluginsRoot, 'SASS.lrplugin'))
    @plugin.initialize({ skipInUnitTest: yes }, done)

  it "should be named 'SASS'", wrap ->
    assert.equal @plugin.name, 'SASS'

  it "should contain SASS and compass compilers", wrap ->
    assert.deepEqual Object.keys(@plugin.compilers), ['sass', 'compass']
