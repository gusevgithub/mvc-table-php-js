<tr>
	<th>ИД</th>
	<th>Дата</th>
	<th>Название</th>
	<th>Количество</th>
	<th>Расстояние</th>  
</tr>
<?php foreach($dynamic['dynamic'] as $val): ?>
<tr>
  <td><?=$val['id']?></td>
  <td><?=$val['date']?></td>
  <td><?=$val['name_product']?></td>
  <td><?=$val['quantity']?></td>
  <td><?=$val['distance']?></td>
</tr>
<?php endforeach; ?>
