var myRange = document.getElementById('myRange');
var demo = document.getElementById('demo');

const row3 = document.querySelector('.row3');
const searchNameModel = document.querySelector('#searchNameModel');
const formCheckInputTalent = document.querySelectorAll(
	'.form-check-input-talent'
);
const formCheckInputRank = document.querySelectorAll('.form-check-input-ranks');
const pagination = document.querySelector('#pagination');
const pageItem = document.querySelectorAll('.page-item');

pageItem.length = 0;

const url = window.location.href;
let pathUrl = url.split('/');
pathUrl = pathUrl[pathUrl.length - 1];

let limit = 0;
let offset = 12;
let dataFindAllModel = [];
let dataRecieveServer = {};
dataRecieveServer['rank'] = [];
dataRecieveServer['talent'] = [];
dataRecieveServer['age'] = 0;
dataRecieveServer['name'];
let talent = [];
let rank = [];

demo.innerHTML = myRange.value;

myRange.oninput = function() {
	demo.innerHTML = this.value;
};

(async function main() {
	dataFindAllModel = await findAll();

	let dataFindAllModelAndLimitAndOffset = await findAllAndLimitAndOffset(
		limit,
		offset
	);

	renderDomAllModel(dataFindAllModelAndLimitAndOffset);

	$('#pagination').twbsPagination('destroy');

	$(function() {
		window.pagObj = $('#pagination').twbsPagination({
			totalPages: Math.ceil(dataFindAllModel.length / offset),
			visiblePages: offset,
			startPage: 1,
			//hideOnlyOnePage: true,
			//initiateStartPageClick: false,
			onPageClick: async function(event, page) {
				window.scroll({
					top: 0,
					behavior: 'smooth',
				});
				//console.info(page + ' (from options)');
				limit = page * offset - offset;
				let dataFindAllModelAndLimitAndOffset = await findAllAndLimitAndOffset(
					limit,
					offset
				);
				renderDomAllModel(dataFindAllModelAndLimitAndOffset);
			},
		});
	});
})();

async function findAll() {
	let response;
	if (pathUrl === 'all') {
		response = await fetch(
			'http://localhost:8080/model/api-admin/model/findall'
		);
	}
	if (pathUrl === 'male') {
		response = await fetch(
			'http://localhost:8080/model/api-admin/model/findall/male'
		);
	}

	if (pathUrl === 'female') {
		response = await fetch(
			'http://localhost:8080/model/api-admin/model/findall/female'
		);
	}

	if (pathUrl === 'kids') {
		response = await fetch(
			'http://localhost:8080/model/api-admin/model/findall/kids'
		);
	}

	if (pathUrl === 'new-faces') {
		response = await fetch(
			'http://localhost:8080/model/api-admin/model/findall/newface'
		);
	}

	let dataJson = await response.json();
	return dataJson;
}

async function findAllAndLimitAndOffset(limit, offset) {
	let response;
	if (pathUrl === 'all') {
		response = await fetch(
			`http://localhost:8080/model/api-admin/model/findallmodelandlimitandoffset?limit=${limit}&offset=${offset}`
		);
	}

	if (pathUrl === 'male') {
		response = await fetch(
			`http://localhost:8080/model/api-admin/model/findall/malemodelandlimitandoffset?limit=${limit}&offset=${offset}`
		);
	}

	if (pathUrl === 'female') {
		response = await fetch(
			`http://localhost:8080/model/api-admin/model/findall/femalemodelandlimitandoffset?limit=${limit}&offset=${offset}`
		);
	}

	if (pathUrl === 'kids') {
		response = await fetch(
			`http://localhost:8080/model/api-admin/model/findall/kidsmodelandlimitandoffset?limit=${limit}&offset=${offset}`
		);
	}

	if (pathUrl === 'new-faces') {
		response = await fetch(
			`http://localhost:8080/model/api-admin/model/findall/newfacemodelandlimitandoffset?limit=${limit}&offset=${offset}`
		);
	}
	let dataJson = await response.json();
	return dataJson;
}

const startColor = data => {
	if (data >= 0 && data < 0.5) {
		return `<span class="ion-ios-star-outline"></span> <span
            class="ion-ios-star-outline"></span> <span
            class="ion-ios-star-outline"></span> <span
            class="ion-ios-star-outline"></span> <span
            class="ion-ios-star-outline"></span>`
	} else if (data >= 0.5 && data < 1.5) {
		return `<span class="ion-ios-star-outline" style="color: orange;"></span> <span
            class="ion-ios-star-outline"></span> <span
            class="ion-ios-star-outline"></span> <span
            class="ion-ios-star-outline"></span> <span
            class="ion-ios-star-outline"></span>`
	} else if (data >= 1.5 && data < 2.5) {
		return `<span class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline"></span> <span
            class="ion-ios-star-outline"></span> <span
            class="ion-ios-star-outline"></span>`
	} else if (data >= 2.5 && data < 3.5) {
		return `<span class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline"></span> <span
            class="ion-ios-star-outline"></span>`
	} else if (data >= 3.5 && data < 4.5) {
		return `<span class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline"></span>`
	} else if (data >= 4.5 && data <= 5) {
		return `<span class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline" style="color: orange"></span> <span
            class="ion-ios-star-outline" style="color: orange"></span>`
	}
}

const templateRenderDomAllModel = (data) => {
	return `<div class="product">
						<a href="/model/model-detail/${data.id}" class="img-prod"><img class="img-fluid" style="width:100%;height:470px;float:left;padding:0 5px;"
							src="${data.imgLink}"
							alt="Colorlib Template"></a>
						<div class="text py-3 px-3">
							<h3>
								<a href="#">${data.name}</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span class="price-sale">${data.rank}</span>
									</p>
								</div>
								<div class="rating">
                  <p class="text-right">
										${startColor(data.rating)}
									</p>
								</div>
							</div>
							<hr>
							<p>Decription:</p>
						</div>
					</div>`;
};

const renderDomAllModel = (data) => {
	row3.innerHTML = '';
	if (data.length <= 0) {
		let div = document.createElement('div');
		div.style.cssText =
			'display:inline-block;width:100%; display: flex; justify-content: center;';
		let image = `<div style="text-align: center; margin-top: 50px;">
                  <img src="resources/images/notfound/system_404_2.png" style="width: 30%"/>
                  <h2>OOPS!</h2>
                  <h3>looks like something went wrong ...</h3>
                </div>  `;
		div.innerHTML = image;
		row3.appendChild(div);
	} else {
		for (let i = 0; i < data.length; i++) {
			let div = document.createElement('div');
			div.style.cssText = 'display:inline-block;width:24%;';
			let template = templateRenderDomAllModel(data[i]);
			div.innerHTML = template;
			row3.appendChild(div);
		}
	}
};

async function mainSearch(dataAPI, data) {

	let dataRecieve;
	let dataTotal;

	console.log(data);

	await $.ajax({
		contentType: 'application/json',
		method: 'POST',
		url: 'http://localhost:8080/model/api-admin/model/findallandsearchandlimit',
		data: JSON.stringify(dataAPI),
		dataType: "json",
		success: function(data) {
			dataRecieve = data;
			console.log(dataRecieve);
		},
		error: function(data) {
			console.log(data);
		},
	});

	await $.ajax({
		contentType: 'application/json',
		method: 'POST',
		url: 'http://localhost:8080/model/api-admin/model/findallandsearchnotlimit',
		data: JSON.stringify(dataAPI),
		dataType: "json",
		success: function(data) {
			dataTotal = data
		},
		error: function(data) {
			console.log(data);
		},
	});

	renderDomAllModel(dataRecieve);

	$('#pagination').twbsPagination('destroy');

	if (dataTotal.length > 0) {
		$(function() {
			//console.log('vo day1');
			window.pagObj = $('#pagination').twbsPagination({
				totalPages: Math.ceil(dataTotal.length / offset),
				visiblePages: offset,
				startPage: 1,
				//hideOnlyOnePage: true,
				//initiateStartPageClick: false,
				onPageClick: async function(event, page) {
					console.log(page, Math.ceil(dataTotal.length / offset));
					window.scroll({
						top: 0,
						behavior: 'smooth',
					});
					limit = page * offset - offset;
					dataAPI['limit'] = limit;
					await $.ajax({
						contentType: 'application/json',
						method: 'POST',
						url: 'http://localhost:8080/model/api-admin/model/findallandsearchandlimit',
						data: JSON.stringify(dataAPI),
						dataType: "json",
						success: function(data) {
							dataRecieve = data;
							console.log(dataRecieve);
							renderDomAllModel(dataRecieve);
						},
						error: function(data) {
							console.log(data);
						},
					});
				},
			});
		});
	}


};

const callAjaxAPI = (dataAPI) => {
	console.log(dataAPI);
	console.log(dataRecieveServer['age'] < 8);
	dataAPI['limit'] = limit;
	dataAPI['offset'] = offset;
	dataRecieveServer['name'] = searchNameModel.value;
	if (dataRecieveServer['age'] < 7) {
		dataRecieveServer['age'] = 32;
	}
	if (pathUrl === 'male') {
		dataRecieveServer['type'] = 'male';
	} else if (pathUrl === 'female') {
		dataRecieveServer['type'] = 'female';
	} else if (pathUrl === 'new-faces') {
		dataRecieveServer['type'] = 'new-faces';
	} else if (pathUrl === 'kids') {
		dataRecieveServer['type'] = 'kids';
	}
	// if (dataRecieveServer['talent'].length <= 0) {
	//   dataRecieveServer['talent'] = [1, 2, 3, 4, 5];
	// }
	if (dataRecieveServer['rank'].length <= 0) {
		dataRecieveServer['rank'] = [1, 2, 3, 4];
	}
	if (dataRecieveServer['name'] == "" && dataRecieveServer['age'] < 8 && dataRecieveServer['talent'].length >= 5 && dataRecieveServer['rank'].length >= 4) {
		$.ajax({
			contentType: 'application/json',
			method: 'POST',
			url: 'http://localhost:8080/model/api-admin/model/findallandsearchnotlimit',
			data: JSON.stringify(dataAPI),
			dataType: "json",
			success: function(data) {
				//console.log(data);
				mainSearch(dataAPI, data);
			},
			error: function(data) {
				console.log(data);
			},
		});
	} else {
		$.ajax({
			contentType: 'application/json',
			method: 'POST',
			url: 'http://localhost:8080/model/api-admin/model/findallandsearchandlimit',
			dataType: "json",
			data: JSON.stringify(dataAPI),
			success: function(data) {
				//console.log(data);
				mainSearch(dataAPI, data);
			},
			error: function(data) {
				console.log(data);
			},
		});
	}
};

myRange.addEventListener('input', function() {
	limit = 0;
	offset = 12;
	dataRecieveServer['age'] = parseInt(myRange.value);
	callAjaxAPI(dataRecieveServer);
});

searchNameModel.addEventListener('keyup', function() {
	limit = 0;
	offset = 12;
	dataRecieveServer['name'] = searchNameModel.value;
	callAjaxAPI(dataRecieveServer);
});

for (let i = 0; i < formCheckInputTalent.length; i++) {
	formCheckInputTalent[i].addEventListener('change', function() {
		limit = 0;
		offset = 12;
		if (this.checked) {
			talent.push(parseInt(this.value));
		} else {
			for (let i = 0; i < talent.length; i++) {
				if (this.value === talent[i].toString()) {
					talent.splice(i, 1);
				}
			}
		}
		dataRecieveServer['talent'] = talent;
		callAjaxAPI(dataRecieveServer);
	});
}

for (let i = 0; i < formCheckInputRank.length; i++) {
	formCheckInputRank[i].addEventListener('change', function() {
		limit = 0;
		offset = 12;
		if (this.checked) {
			rank.push(parseInt(this.value));
		} else {
			for (let i = 0; i < rank.length; i++) {
				if (this.value === rank[i].toString()) {
					rank.splice(i, 1);
				}
			}
		}
		dataRecieveServer['rank'] = rank;
		callAjaxAPI(dataRecieveServer);
	});
}
