  <h1><?=$static['static']?></h1>
  <form>
    <select class="oneFilter">
      <option value="columnAll">Выбрать столбец</option>
      <option value="nameProduct">Название</option>
      <option value="quantity">Количество</option>
      <option value="distance">Расстояние</option>
    </select>
    <select class="twoFilter">
      <option value="paramAll">Выбрать условие</option>
      <option value="equalTo">Равно</option>
      <option value="contains">Содержит</option>
      <option value="greaterThan">Больше</option>
      <option value="lessThan">Меньше</option>
    </select>
    <input type="text" class="textFilter" value="">
    <button class="btnFilter">Фильтровать</button>
  </form>
	<div class="table">
  <table>
    
		
  </table>
  <p class="message"></p>
  </div>
  <div class="pagination" data-page="1">
    <ul>
    </ul>
  </div>
