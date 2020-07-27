<?php
namespace PHP\Controllers;

use \PHP\Models\HomeModel;
use \Core\View;

class Home {
	
	public $dynamic = [];
	
	// Метод, который выводит статический контент.
  public function indexAction() {
		self::getHead();
		self::staticContent();
		self::getFooter();
        
  }
	
	// Метод, который выводит динамический контент (данные таблицы).
	public function dynamicContent() {
		
		$dynamic = self::postResult();
		
		if(!empty($dynamic)) {
			\Core\View::contentDynamicTmpl('Home', 'dynamic', ['dynamic' => $dynamic]);
		}

	}
	
	// Метод, который выводит массив, количество страниц для пагинации.
	public function pagination() {
		$result = self::postResult();

		$pagin = [];
		
 		$pages = $result[0][0]; // Всего страниц после запроса
 		$kol = $result[0][2];	// Количество строк (записей) на странице
		$art = $result[0][3];	// Номер строки, с которой выводится страница со строками.
		$pol = ceil($pages / 2); 
		
		for($i = 0; $i < $pages; $i++) {
			$pagin[] = $i + 1;
		}

		\Core\View::paginationTmpl('Home', 'pagination', ['pagin' => $pagin]);

	}
	
	// Метод, который получает данные от JavaScript (fetch()).
	// Совешает запрос по параметрам к БД и выводит данные в виде массива.
	public function postResult() {
		$input = file_get_contents('php://input');
		$input = json_decode($input);
		$a = filter_var($input->a, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
		$b = filter_var($input->b, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
		$c = filter_var($input->c, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
		$d = filter_var($input->d, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

		$dynamic = self::getMethod($a, $b, $c, $d);
		return $dynamic;

	}
	
	// Метод, который выводит только статический контент.
	public function staticContent() {
		$static = "Таблица в формате Single Page Application";
		\Core\View::contentStaticTmpl('Home', 'static', ['static' => $static]);
	}
	
	// Метод, который выводит верхнюю часть сайта.
  public function getHead() {
    $head['title'] = 'JavaScript and forms, and PHP';	
    \Core\View::headTpl(['head' => $head]);

	}
   
	// Метод, который выводит нижнюю часть сайте.
  public function getFooter() {
    $footer['footer'] = '';	
    \Core\View::footerTpl(['footer' => $footer]);
    
  }
  
  // Вспомогательная функция для запросов в БД и вывода данных используя фильтры
  public function getSwitch($get_two, $name_parameter, $get_search, $page) {
    // Вывод количество записей за один запрос (на странице строки)
    $kol = 5;
    // Если номер страницы, то устанавливаем номер записи, с которой нужно выводить данные.
    if($page) {
      $art = ceil($kol * (int)$page);   
    } else {
      $art = 0;
    }
    // Если выбор select (выбор какого либо условия), то вставляем данные для вывода из БД.
    switch($get_two) {
      case 'equalTo':
        $result = \PHP\Models\HomeModel::getDataAll($name_parameter, '=', $get_search, $kol, $art);
        return $result;
      break;
      case 'contains':
        $result = \PHP\Models\HomeModel::getDataAll($name_parameter, 'LIKE', $get_search, $kol, $art); 
        return $result;
      break;
      case 'greaterThan':
        $result = \PHP\Models\HomeModel::getDataAll($name_parameter, '>', $get_search, $kol, $art); 
        return $result;
      break;
      case 'lessThan':
        $result = \PHP\Models\HomeModel::getDataAll($name_parameter, '<', $get_search, $kol, $art); 
        return $result;
      break;
      default:
        $result = \PHP\Models\HomeModel::getDataAll($name_parameter, 'LIKE', "", $kol, $art);       
        return $result;
      break;
    }
  }

  // Функция для запросов в БД и вывода данных используя фильтры
  public function getMethod($get_one, $get_two, $get_search, $page) {
    // Вывод количество записей за один запрос (на странице строки)
    $kol = 5;
    // Если номер страницы, то устанавливаем номер записи, с которой нужно выводить данные.
    if($page) {
      $art = ceil($kol * (int)$page);   
    } else {
      $art = 0;
    }
   // Если input type="text" не пустой и задан первый select (выбрать столбец),
   // то вызываем вспомогательную функцию getSwitch() для вывода результата.
   if($get_search !== '' && $get_search !== false) {
    switch($get_one) {
      case 'nameProduct':
        $result = self::getSwitch($get_two, 'name_product', $get_search, $page);
        return $result;
      break;
      case 'quantity':
        $result = self::getSwitch($get_two, 'quantity', $get_search, $page);
        return $result;
      break;
      case 'distance':
        $result = self::getSwitch($get_two, 'distance', $get_search, $page);
        return $result;
      break;
    }

   } else {
    // Запрос к БД и вывод данных по умолчанию.
    $result = \PHP\Models\HomeModel::getDataAll('name_product', 'LIKE', "", $kol, $art);       
    return $result;
   }
  }


}

?>