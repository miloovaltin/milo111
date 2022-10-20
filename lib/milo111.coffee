Milo111View = require './milo111-view'
{CompositeDisposable} = require 'atom'

module.exports = Milo111 =
  milo111View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @milo111View = new Milo111View(state.milo111ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @milo111View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'milo111:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @milo111View.destroy()

  serialize: ->
    milo111ViewState: @milo111View.serialize()

  toggle: ->
    console.log 'Milo111 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
