###
PptxGen.coffee
Created by @contextmatters, based on DocxGen by Edgar HIPP
###

DocUtils=require('./docUtils')
DocxGen=require('./docxgen')
PptXTemplater=require('./pptxTemplater')
JSZip=require('jszip')

PptxGen = class PptxGen extends DocxGen
	constructor:(content,options)->
		super(content,options)
		@templateClass = PptXTemplater
		@templatedFiles = @getTemplatedFiles()
	getTemplatedFiles: ()->
		["ppt/presentation.xml"].concat @slideTemplates()
	slideTemplates: ()->
		@slides ||= @zip.file(/ppt\/slides\/slide\d\.xml/).map (file) -> file.name

module.exports=PptxGen
