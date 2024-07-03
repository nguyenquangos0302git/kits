var url = window.location.href;
var urlParse = url.split("/");
var idModel = parseInt(urlParse[urlParse.length - 1]);
var calenderRender = document.querySelector('#one');
var btnAddCart1 = document.querySelector('#btnAddCart1');

var dataBooking = [];
var dataCalender;
var arrayPrepareBooking = [];
let accountid = 0;

var getDataBooking = callback => {

	console.log(idModel);

	fetch(`http://localhost:8080/model/api-model/model-detail/${idModel}`)
		.then(res => {
			return res.json();
		})
		.then(data => {
			callback(undefined, data);
		})
		.catch(error => {
			callback(error, undefined);
		})
}

getDataBooking((error, dataCalendar) => {
	if (error) {
		console.log(error);
	} else {
		accountid;
		let modelid;
		console.log(dataCalendar);
		if (dataCalendar[dataCalendar.length - 1].accountid === 0) {
			console.log("login");
			for (let i = 0; i < dataCalendar.length; i++) {
				const dataObjectBooking = {};
				dataObjectBooking["date"] = dataCalendar[i].startyear + '-' + dataCalendar[i].startmonth + '-' + dataCalendar[i].startdate;
				dataObjectBooking["value"] = dataCalendar[i].status === true ? "busy" : "pending";
				dataBooking.push(dataObjectBooking);
			}
		} else {
			if (dataCalendar) {
				accountid = dataCalendar[dataCalendar.length - 1].accountid;
				modelid = idModel;
			} else {
				accountid = dataCalendar[0].accountid;
				modelid = idModel;
			}
			for (let i = 0; i < dataCalendar.length; i++) {
				const dataObjectBooking = {};
				dataObjectBooking["date"] = dataCalendar[i].startyear + '-' + dataCalendar[i].startmonth + '-' + dataCalendar[i].startdate;
				dataObjectBooking["value"] = dataCalendar[i].status === true ? "busy" : "pending";
				dataBooking.push(dataObjectBooking);
			}
		}
		$('#one').calendar({
			// view: 'month',
			width: 320,
			height: 320,
			// startWeek: 0,
			// selectedRang: [new Date(), null],
			data: dataBooking,
			monthArray: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
			date: new Date(),
			onSelected: function(view, date, data) {
				const selected = document.querySelector('.calendar .calendar-views .selected');
				//console.log(selected);
				let nowDay = new Date();
				if (date <= nowDay) {
					alert("Please, booking model before one day.");
				} else {
					let count = 0;

					const classDataLi = document.querySelectorAll('.days');

					for (let k = 0; k < classDataLi.length; k++) {
						const classDataDots = classDataLi[k].querySelectorAll('li');
						for (let i = 0; i < classDataDots.length; i++) {
							let dateIdentification = classDataDots[i].getAttribute('data-calendar-day').split("/");
							let yearDateIdentification = parseInt(dateIdentification[0]);
							let monthDateIdentification = parseInt(dateIdentification[1]);
							let dayDateIdentification = parseInt(dateIdentification[2]);
							if (yearDateIdentification === date.getFullYear() && monthDateIdentification === (date.getMonth() + 1) && dayDateIdentification === date.getDate()) {
								if (classDataDots[i].getAttribute('class') === "new" || classDataDots[i].getAttribute('class') === "old") {
									if (data === 'busy') {

									} else {
										//console.log(classDataDots[i].getAttribute('class'));
										let obj = {};
										obj["accountid"] = accountid;
										obj["modelid"] = modelid;
										obj["startdate"] = date.getDate();
										obj["startmonth"] = date.getMonth() + 1;
										obj["startyear"] = date.getFullYear();
										obj["status"] = 0;
										arrayPrepareBooking.push(obj);
										//console.log(arrayPrepareBooking);
										count++;
									}
								}
							}
						}
					}

					if (data === 'busy') {
						alert("Model will be hired in that day.");
					} else if (count === 0) {
						if ((selected.getAttributeNode('class').value === 'addmodel selected' || selected.getAttributeNode('class').value === "selected addmodel")) {
							for (let i = 0; i < arrayPrepareBooking.length; i++) {
								if (arrayPrepareBooking[i].startdate === date.getDate() && arrayPrepareBooking[i].startmonth === date.getMonth() + 1 && arrayPrepareBooking[i].startyear === date.getFullYear()) {
									arrayPrepareBooking.splice(i, 1);
								}
							}
							//console.log(arrayPrepareBooking);
						} else {
							let obj = {};
							obj["accountid"] = accountid;
							obj["modelid"] = modelid;
							obj["startdate"] = date.getDate();
							obj["startmonth"] = date.getMonth() + 1;
							obj["startyear"] = date.getFullYear();
							obj["status"] = 0;
							arrayPrepareBooking.push(obj);
							//console.log(arrayPrepareBooking);
						}
					}

					for (let k = 0; k < classDataLi.length; k++) {
						const classDataDots = classDataLi[k].querySelectorAll('li');
						for (let i = 0; i < classDataDots.length; i++) {
							let dateIdentification = classDataDots[i].getAttribute('data-calendar-day').split("/");
							let yearDateIdentification = parseInt(dateIdentification[0]);
							let monthDateIdentification = parseInt(dateIdentification[1]);
							let dayDateIdentification = parseInt(dateIdentification[2]);
							classDataDots[i].classList.remove('addmodel');
							for (let j = 0; j < arrayPrepareBooking.length; j++) {
								if (yearDateIdentification === arrayPrepareBooking[j].startyear && monthDateIdentification === arrayPrepareBooking[j].startmonth && dayDateIdentification === arrayPrepareBooking[j].startdate) {
									//console.log(classDataDots[i]);
									classDataDots[i].classList.add('addmodel');
								}
							}
						}
					}
					console.log(arrayPrepareBooking);
				}
			},
		});

		const next = document.querySelector('.next');
		const prev = document.querySelector('.prev');

		let dateNow = new Date();
		next.addEventListener('click', function(event) {
			const classDataLi = document.querySelectorAll('.days');

			for (let k = 0; k < classDataLi.length; k++) {
				const classDataDots = classDataLi[k].querySelectorAll('li');
				for (let i = 0; i < classDataDots.length; i++) {
					let dateIdentification = classDataDots[i].getAttribute('data-calendar-day').split("/");
					let yearDateIdentification = parseInt(dateIdentification[0]);
					let monthDateIdentification = parseInt(dateIdentification[1]);
					let dayDateIdentification = parseInt(dateIdentification[2]);
					for (let j = 0; j < dataCalendar.length; j++) {
						if (dataCalendar[j].status === false) {
							if (yearDateIdentification === dataCalendar[j].startyear && monthDateIdentification === dataCalendar[j].startmonth && dayDateIdentification === dataCalendar[j].startdate) {
								let classDot = classDataDots[i].querySelector('.dot');
								if (dataCalendar[j].startyear >= dateNow.getFullYear() && dataCalendar[j].startmonth >= (dateNow.getMonth() + 1)) {
									if (dataCalendar[j].startmonth > (dateNow.getMonth() + 1)) {
										classDot.style.background = '#fcc200';
									}
									else if (dataCalendar[j].startmonth === (dateNow.getMonth() + 1)) {
										if (dataCalendar[j].startdate > dateNow.getDate()) {
											classDot.style.background = '#fcc200';
										} else {
											classDot.style.background = 'none';
										}
									}
								} else {
									classDot.style.background = 'none';
								}
							}
						}
						if (dataCalendar[j].status === true) {
							if (yearDateIdentification === dataCalendar[j].startyear && monthDateIdentification === dataCalendar[j].startmonth && dayDateIdentification === dataCalendar[j].startdate) {
								let classDot = classDataDots[i].querySelector('.dot');
								if (dataCalendar[j].startyear >= dateNow.getFullYear() && dataCalendar[j].startmonth >= (dateNow.getMonth() + 1)) {
									if (dataCalendar[j].startmonth > (dateNow.getMonth() + 1)) {
										classDot.style.background = '#66be8c';
									}
									else if (dataCalendar[j].startmonth === (dateNow.getMonth() + 1)) {
										if (dataCalendar[j].startdate > dateNow.getDate()) {
											classDot.style.background = '#66be8c';
										} else {
											classDot.style.background = 'none';
										}
									}
								} else {
									classDot.style.background = 'none';
								}
							}
						}
					}
				}
			}

			for (let k = 0; k < classDataLi.length; k++) {
				const classDataDots = classDataLi[k].querySelectorAll('li');
				for (let i = 0; i < classDataDots.length; i++) {
					let dateIdentification = classDataDots[i].getAttribute('data-calendar-day').split("/");
					let yearDateIdentification = parseInt(dateIdentification[0]);
					let monthDateIdentification = parseInt(dateIdentification[1]);
					let dayDateIdentification = parseInt(dateIdentification[2]);
					classDataDots[i].classList.remove('addmodel');
					for (let j = 0; j < arrayPrepareBooking.length; j++) {
						if (yearDateIdentification === arrayPrepareBooking[j].startyear && monthDateIdentification === arrayPrepareBooking[j].startmonth && dayDateIdentification === arrayPrepareBooking[j].startdate) {
							//console.log(classDataDots[i]);
							classDataDots[i].classList.add('addmodel');
						}
					}
				}
			}

		})

		prev.addEventListener("click", function(event) {
			const classDataLi = document.querySelectorAll('.days');

			for (let k = 0; k < classDataLi.length; k++) {
				const classDataDots = classDataLi[k].querySelectorAll('li');
				for (let i = 0; i < classDataDots.length; i++) {
					let dateIdentification = classDataDots[i].getAttribute('data-calendar-day').split("/");
					let yearDateIdentification = parseInt(dateIdentification[0]);
					let monthDateIdentification = parseInt(dateIdentification[1]);
					let dayDateIdentification = parseInt(dateIdentification[2]);
					for (let j = 0; j < dataCalendar.length; j++) {
						if (dataCalendar[j].status === false) {
							if (yearDateIdentification === dataCalendar[j].startyear && monthDateIdentification === dataCalendar[j].startmonth && dayDateIdentification === dataCalendar[j].startdate) {
								let classDot = classDataDots[i].querySelector('.dot');
								if (dataCalendar[j].startyear >= dateNow.getFullYear() && dataCalendar[j].startmonth >= (dateNow.getMonth() + 1)) {
									if (dataCalendar[j].startmonth > (dateNow.getMonth() + 1)) {
										classDot.style.background = '#fcc200';
									}
									else if (dataCalendar[j].startmonth === (dateNow.getMonth() + 1)) {
										if (dataCalendar[j].startdate > dateNow.getDate()) {
											classDot.style.background = '#fcc200';
										} else {
											classDot.style.background = 'none';
										}
									}
								} else {
									classDot.style.background = 'none';
								}
							}
						}
						if (dataCalendar[j].status === true) {
							if (yearDateIdentification === dataCalendar[j].startyear && monthDateIdentification === dataCalendar[j].startmonth && dayDateIdentification === dataCalendar[j].startdate) {
								let classDot = classDataDots[i].querySelector('.dot');
								if (dataCalendar[j].startyear >= dateNow.getFullYear() && dataCalendar[j].startmonth >= (dateNow.getMonth() + 1)) {
									if (dataCalendar[j].startmonth > (dateNow.getMonth() + 1)) {
										classDot.style.background = '#66be8c';
									}
									else if (dataCalendar[j].startmonth === (dateNow.getMonth() + 1)) {
										if (dataCalendar[j].startdate > dateNow.getDate()) {
											classDot.style.background = '#66be8c';
										} else {
											classDot.style.background = 'none';
										}
									}
								} else {
									classDot.style.background = 'none';
								}
							}
						}
					}
				}
			}

			for (let k = 0; k < classDataLi.length; k++) {
				const classDataDots = classDataLi[k].querySelectorAll('li');
				for (let i = 0; i < classDataDots.length; i++) {
					let dateIdentification = classDataDots[i].getAttribute('data-calendar-day').split("/");
					let yearDateIdentification = parseInt(dateIdentification[0]);
					let monthDateIdentification = parseInt(dateIdentification[1]);
					let dayDateIdentification = parseInt(dateIdentification[2]);
					classDataDots[i].classList.remove('addmodel');
					for (let j = 0; j < arrayPrepareBooking.length; j++) {
						if (yearDateIdentification === arrayPrepareBooking[j].startyear && monthDateIdentification === arrayPrepareBooking[j].startmonth && dayDateIdentification === arrayPrepareBooking[j].startdate) {
							//console.log(classDataDots[i]);
							classDataDots[i].classList.add('addmodel');
						}
					}
				}
			}
		})

		const classDataLi = document.querySelectorAll('.days');
		for (let k = 0; k < classDataLi.length; k++) {
			const classDataDots = classDataLi[k].querySelectorAll('li');
			for (let i = 0; i < classDataDots.length; i++) {
				let dateIdentification = classDataDots[i].getAttribute('data-calendar-day').split("/");
				let yearDateIdentification = parseInt(dateIdentification[0]);
				let monthDateIdentification = parseInt(dateIdentification[1]);
				let dayDateIdentification = parseInt(dateIdentification[2]);
				for (let j = 0; j < dataCalendar.length; j++) {
					if (dataCalendar[j].status === false) {
						if (yearDateIdentification === dataCalendar[j].startyear && monthDateIdentification === dataCalendar[j].startmonth && dayDateIdentification === dataCalendar[j].startdate) {
							let classDot = classDataDots[i].querySelector('.dot');
							if (dataCalendar[j].startyear >= dateNow.getFullYear() && dataCalendar[j].startmonth >= (dateNow.getMonth() + 1)) {
								if (dataCalendar[j].startmonth > (dateNow.getMonth() + 1)) {
									classDot.style.background = '#fcc200';
								}
								else if (dataCalendar[j].startmonth === (dateNow.getMonth() + 1)) {
									if (dataCalendar[j].startdate > dateNow.getDate()) {
										classDot.style.background = '#fcc200';
									} else {
										classDot.style.background = 'none';
									}
								}
							} else {
								classDot.style.background = 'none';
							}
						}
					}
					if (dataCalendar[j].status === true) {
						if (yearDateIdentification === dataCalendar[j].startyear && monthDateIdentification === dataCalendar[j].startmonth && dayDateIdentification === dataCalendar[j].startdate) {
							let classDot = classDataDots[i].querySelector('.dot');
							if (dataCalendar[j].startyear >= dateNow.getFullYear() && dataCalendar[j].startmonth >= (dateNow.getMonth() + 1)) {
								if (dataCalendar[j].startmonth > (dateNow.getMonth() + 1)) {
									classDot.style.background = '#66be8c';
								}
								else if (dataCalendar[j].startmonth === (dateNow.getMonth() + 1)) {
									if (dataCalendar[j].startdate > dateNow.getDate()) {
										classDot.style.background = '#66be8c';
									} else {
										classDot.style.background = 'none';
									}
								}
							} else {
								classDot.style.background = 'none';
							}
						}
					}
				}
			}
		}
	}
});

btnAddCart1.addEventListener('click', function(event) {
	event.preventDefault();
	console.log(JSON.stringify(arrayPrepareBooking));
	console.log(accountid);
	if (accountid === 0) {
		var ans = confirm("Please login before");
		if (ans) {
			window.location.href = "http://localhost:8080/model/login";
		}
	} else {
		$.ajax({
			type: 'POST',
			contentType: 'application/json',
			url: 'http://localhost:8080/model/api-booking/booking/insert',
			data: JSON.stringify(arrayPrepareBooking),
			success: function(data) {
				location.reload(true);
			},
			error: function(error) {
				location.reload(true);
			}
		})
	}

})