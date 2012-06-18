#
#
#
exec = require('child_process').exec
fs = require("fs")

#
# Public: Sync write content to a filename
#
# name - file name / relative path
# content - content string
#
writeToFile = (name, content) ->
  f = fs.openSync name, "w"
  fs.writeSync f, content
  fs.closeSync f

exports.createProject = (folder, opts) ->
  bmCopy = "bm.js.copy"
  outName = opts.output or "bm"
  mainScriptName = opts.main or "bookmarklet"

  generator = ["#!/bin/sh"]
  fs.mkdirSync(folder)
  fs.mkdirSync "#{folder}/out"
  fs.mkdirSync "#{folder}/resources"


  commands = ["cd #{folder}"]
  if opts.zepto
    commands.push "curl http://zeptojs.com/zepto.min.js > resources/zepto.min.js"
    generator.push "cat resources/*.js >  out/#{outName}.js"
  generator.push "coffee -c *.coffee && cat *.js >> out/#{outName}.js"
  if opts.s3
    generator.push "s3cmd put out/#{outName}.js s3://#{opts.s3}/#{outName}.js"

  # first create generator file
  # ...
  writeToFile "./#{folder}/generator", generator.join "\n"
  writeToFile "./#{folder}/#{bmCopy}", "javascript:(function(){X = document.createElement(\"SCRIPT\");X.src = \"#{opts.url}\";document.getElementsByTagName('head')[0].appendChild(X);})()"
  writeToFile "./#{folder}/#{mainScriptName}.coffee", """# PUT CODE HERE
( ->
)
"""
  commands.push "chmod +x generator"


  if opts.git
    commands.push "git init"
    commands.push "git add #{bmCopy} generator #{mainScriptName}.coffee resources"
    commands.push "git commit -am 'Initial commit'"

  exec commands.join(" && "), ->
    console.log "project #{folder} created"
