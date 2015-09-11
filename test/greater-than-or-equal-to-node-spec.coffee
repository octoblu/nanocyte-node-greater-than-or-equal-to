GreaterThanOrEqualToNode = require '../src/greater-than-or-equal-to-node.coffee'
describe 'GreaterThanOrEqualToNode', ->
  beforeEach ->
    @sut = new GreaterThanOrEqualToNode

  it 'should exist', ->
    expect(@sut).to.exist

  it 'should have an onMessage function', ->
    expect(@sut.onMessage).to.exist

  describe '->onMessage', ->
    describe 'when called with left greater than right', ->
      beforeEach ->
        @config =
          left: 10
          right: 5
        @message = 'greater than!'

        @callback = sinon.spy()
        @sut = new GreaterThanOrEqualToNode @config
        @sut.onMessage @message, @callback

      it 'should call the callback with the message', ->
        expect(@callback).to.have.been.calledWith null, @message

    describe 'when called with left less than right', ->
      beforeEach ->
        @config =
          left: 0
          right: 6
        @message = 'lessTHANright'

        @callback = sinon.spy()
        @sut = new GreaterThanOrEqualToNode @config
        @sut.onMessage @message, @callback

      it 'should call the callback with null', ->
        expect(@callback).to.have.been.calledWith null
        expect(@callback).to.not.have.been.calledWith @message

    describe 'when called with left equal to right', ->
      beforeEach ->
        @config =
          left: 666
          right: 666
        @message = 'equal'

        @callback = sinon.spy()
        @sut = new GreaterThanOrEqualToNode @config
        @sut.onMessage @message, @callback

      it 'should call the callback with null and the message', ->
        expect(@callback).to.have.been.calledWith null, @message
