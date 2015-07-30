module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'atom-insertnums:insert', => @insert()

  insert: ->
    editor = atom.workspace.getActiveTextEditor()
    unless editor then return
    ranges = editor.getSelectedBufferRanges()

    ranges.sort (a, b) ->
      return -1 if a.start.isLessThan b.start
      return 1 if a.start.isGreaterThan b.start
      return 0

    insert = 1
    for r in ranges
      editor.setTextInBufferRange r, insert.toString()
      insert++
