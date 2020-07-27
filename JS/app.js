// Функция обратного вызова, которая работает с контроллером Home.php
(async ()=>{
	// Константы существующих элементов.
	const Body = await document.querySelector('body')
	const App = await document.querySelector('#app')
	const oneSelect = await document.querySelector('.oneFilter')
  const twoSelect = await document.querySelector('.twoFilter')
  const textInput = await document.querySelector('.textFilter')
  const button = await document.querySelector('.btnFilter')
  const table = await document.querySelector('table')
  const pagination = await document.querySelector('.pagination')
  const ul = await document.querySelector('ul')
	
	// Функция, которая выводит кнопки пагинации от текущей +- 2 кнопки
	const funcPagePagination = async (e_pl_1, e_pl_2, e_min_1, e_min_2)=>{
		
		if(e_pl_1 != await undefined) {
			if(e_pl_1.style.display !== await 'inline-block') {
				e_pl_1.style.display = await 'inline-block'	
			} 
		}
		if(e_pl_2 != await undefined) {
			if(e_pl_2.style.display !== await 'inline-block') {
				e_pl_2.style.display = await 'inline-block'
				e_pl_1.style.display = await 'inline-block'
			} 
		}
			
		if(e_min_1 != await undefined) {
			if(e_min_1.style.display !== await 'inline-block') {
				e_min_1.style.display = await 'inline-block'
			} 
		}
		if(e_min_2 != await undefined) {
			if(e_min_2.style.display !== await 'inline-block') {
				e_min_2.style.display = await 'inline-block'	
				e_min_1.style.display = await 'inline-block'								
			}
		}
	
	}

	// Функция, обработчик события, которая приводит в действие пагинацию.
	const funcFetchPagin = async (e)=>{
		e.preventDefault()
		// Если нажата кнопка пагинации, то атрибут data-page="номер кнопки пагинации".
		pagination.dataset.page = await e.target.dataset.href
		// Объект, с данными формы: первый селектор, второй селектор, 
		// поле ввода и данные атрибута пагинации для вывода нужных страниц с данными.
		const data = await {
			a: await oneSelect.value,
			b: await twoSelect.value,
			c: await textInput.value,
			d: await pagination.dataset.page
		}
		const url = await `/home/dynamicContent`
		const response = await fetch(url, {
			method: await "POST",
			body: await JSON.stringify(data),
			headers: await {
				"Content-Type" :"aplication/text;charset=UTF-8"
			}
		})	
		const text = await response.text()
		table.innerHTML = await text
		const linkElem = await document.querySelectorAll('a')
		const prev = await document.querySelector('#prev')
		const next = await document.querySelector('#next')
		
		for(let i = 0; i < linkElem.length; i++) {
			linkElem[i].classList.remove('active')
			e.target.classList.add('active')
			linkElem[i].style.display = await 'none'
		}
		 

		 		 
	 
		if(linkElem.length - 1 > 3) {
			e.target.style.display = await 'inline-block'
			// Вызов функции, которая выводит кнопки пагинации от текущей +- 2 кнопки
			funcPagePagination(
				linkElem[Number(e.target.dataset.href) + 1],
				linkElem[Number(e.target.dataset.href) + 2],
				linkElem[Number(e.target.dataset.href) - 1],
				linkElem[Number(e.target.dataset.href) - 2]
			)
			
			// Пояление и исчезновение кнопок "Prev" and "Next".
			if(e.target.dataset.href < linkElem.length - 3) {				
				linkElem[linkElem.length - 1].style.display = await 'inline-block'
				linkElem[linkElem.length - 1].innerHTML = await 'Next'
				
			} else {
				linkElem[linkElem.length - 1].style.display = await 'inline-block'
				linkElem[linkElem.length - 1].innerHTML = await linkElem.length
			}
			
				if(e.target.dataset.href > 3) {
				linkElem[0].style.display = await 'inline-block' 
				linkElem[0].innerHTML = await 'Prev'
			} else {
				linkElem[0].style.display = await 'inline-block' 
				linkElem[0].innerHTML = await '1'
			}
	
		} else {
			for(let i = 0; i < linkElem.length; i++) {		
				// Остальные кнопки будут видимы.	
				linkElem[i].style.display = await 'inline-block'
			}
		}
	}
	
	// Вспомогательная функция, которая выполняет HTTP запрос с помощью fetch() к данным. 
	const funcFetch = async (paginationDatasetPage, url)=>{

			const data = await {
			a: await oneSelect.value,
			b: await twoSelect.value,
			c: await textInput.value,
			d: await paginationDatasetPage
		}
		const response = await fetch(url, {
			method: await "POST",
			body: await JSON.stringify(data),
			headers: await {
				"Content-Type" :"aplication/text;charset=UTF-8"
			}
		})	
		const text = await response.text()
		return text;
	}
	// Функция, обработчик события, который выводит первую страницу с данными.
	const handDefault = async (e)=>{
		e.preventDefault()
		pagination.dataset.page = await "0"
		const text = await funcFetch(pagination.dataset.page, `/home/dynamicContent`);
		table.innerHTML = await text		
		
	}
	// Функция, обработчик события, который выводит пагинацию.
	const handPagination = async (e)=>{
		e.preventDefault()
		pagination.dataset.page = await "0"
		const text = await funcFetch(pagination.dataset.page, `/home/pagination`);

		ul.innerHTML = await text					
		const link = await document.querySelectorAll('a')		
		//link[0].classList.add('active')	
		
		for(let i = 0; i < link.length; i++) {		
			// Отображение кнопок пагинации	по умолчанию.
			if(link.length - 1 > 4) {
				link[i].style.display = await 'none'
				link[0].style.display = await 'inline-block'
				link[1].style.display = await 'inline-block'
				link[2].style.display = await 'inline-block'
				link[3].style.display = await 'inline-block'
				link[link.length - 1].style.display = await 'inline-block'
				link[link.length - 1].innerHTML = await 'Next'		
			} else {
				link[i].style.display = await 'inline-block'
			}
			// Вызов обработчика событий для кнопок пагинации.
			link[i].addEventListener('click', funcFetchPagin)
		} 

	}
	// Вызвов обработчиков событий, window - при загрузке странице,
	// button - при нажатии на кнопку "Фильтровать".
	button.addEventListener('click', handDefault)
	window.addEventListener('load', handDefault)
	button.addEventListener('click', handPagination)
	window.addEventListener('load', handPagination)

})()