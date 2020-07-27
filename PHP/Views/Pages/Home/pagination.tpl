
<!--<li><span id="prev" data-href="0" class="prev">Prev</span></li>-->
<?php for($i = 0; $i < count($pagin['pagin']); $i++):?>

<li><a href="/?page=<?=$pagin['pagin'][$i] - 1?>" data-href="<?=$pagin['pagin'][$i] - 1?>" class="link"><?=$pagin['pagin'][$i]?></a></li>

<?php endfor;?>

<!--<li><span id="next" data-href="<?php echo count($pagin['pagin']) - 1?>" class="next">Next</span></li>-->