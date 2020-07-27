<?php
namespace Core;

class View
{	
	// Метод, который выводит в файл tpl массив данных пагинации.
	public static function paginationTmpl($dir_view, $file_name, $pagin = [])
	{
		$vars = get_defined_vars();
		if(isset($vars['pagin'])) {
			$view_file = $_SERVER['DOCUMENT_ROOT'] . '/PHP/Views/Pages/'.$dir_view.'/'.$file_name.'.tpl';
			include $view_file;
			extract($pagin, EXTR_SKIP);
			return $pagin;
		}
	}
		// Метод, который выводит в файл tpl массив данных основного контента.
	public static function contentDynamicTmpl($dir_view, $file_name, $dynamic = [])
	{
		$vars = get_defined_vars();
		if(isset($vars['dynamic'])) {
			$view_file = $_SERVER['DOCUMENT_ROOT'] . '/PHP/Views/Pages/'.$dir_view.'/'.$file_name.'.tpl';
			include $view_file;
			extract($dynamic, EXTR_SKIP);
			return $dynamic;
		}
	}
	// Метод, который выводит в файл tpl статический контент какой либо страницы.
	public static function contentStaticTmpl($dir_view, $file_name, $static = [])
	{
		$vars = get_defined_vars();
		if(isset($vars['static'])) {
			$view_file = $_SERVER['DOCUMENT_ROOT'] . '/PHP/Views/Pages/'.$dir_view.'/'.$file_name.'.tpl';
			include $view_file;
			extract($static, EXTR_SKIP);
			return $static;
		}
	}
	// Метод, который выводит в файл tpl статический контент верхней части какой либо страницы.
 	public static function headTpl($head = [])
	{
		$view = $_SERVER['DOCUMENT_ROOT'] . '/PHP/Views/head.tpl';	
		include $view;
		extract($head, EXTR_SKIP);
		return $head;
	}
	// Метод, который выводит в файл tpl статический контент нижней части какой либо страницы.
	public static function footerTpl($footer = [])
	{
		$view = $_SERVER['DOCUMENT_ROOT'] . '/PHP/Views/footer.tpl';	
		include $view;
		extract($footer, EXTR_SKIP);
		return $footer;
	}
	
}