/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.language='zh-cn';
	config.width = 'auto';
	config.toolbarCanCollapse = true
	config.height = 'auto';
	config.resize_enabled = false;
	config.image_previewText='  '; //预览区域显示内容
	config.filebrowserUploadUrl = "/ckeditor/upload";//上传图片
	config.filebrowserImageUploadUrl="/ckeditor/upload"; 
};
