/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.language =  "zh-cn" ; 
	config.toolbar = 'Full';
    config.height = 300;
    config.image_previewText = " ";

	config.toolbarGroups = [
		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'links' },
		{ name: 'insert' },
		{ name: 'forms' },
		{ name: 'tools' },
		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'others' },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'about' }
	];
	
	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	
	//加入ckfinder
	   config.filebrowserBrowseUrl = '/ostp/resources/ckfinder/ckfinder.html' ;  
	   config.filebrowserImageBrowseUrl = '/ostp/resources/ckfinder/ckfinder.html?type=Images' ;  
	   config.filebrowserFlashBrowseUrl = '/ostp/resources/ckfinder/ckfinder.html?type=Flash' ;  
	   config.filebrowserUploadUrl = '/ostp/resources/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files' ;  
	   config.filebrowserImageUploadUrl = '/ostp/resources/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images' ;  
	   config.filebrowserFlashUploadUrl = '/ostp/resources/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash' ;  
	   config.filebrowserWindowWidth = '1000';  
	   config.filebrowserWindowHeight = '700';  
	   config.language =  "zh-cn" ;  

};
