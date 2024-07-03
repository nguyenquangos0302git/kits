const xlabel = [];
const dataIncome = [];
const dataSpending = [];
const dataIncomeReport = [];
const dataSpendingReport = [];
async function chartIt() {
  await getData();

  let ctx = document.getElementById('bar-chart-grouped').getContext("2d");

  let gradientStrokeBlue = ctx.createLinearGradient(0, 0, 0, 360);
  gradientStrokeBlue.addColorStop(0, 'rgba(54, 215, 232, 1)');
  gradientStrokeBlue.addColorStop(1, 'rgba(177, 148, 250, 1)');

  let gradientStrokeRed = ctx.createLinearGradient(0, 0, 0, 300);
  gradientStrokeRed.addColorStop(0, 'rgba(255, 191, 150, 1)');
  gradientStrokeRed.addColorStop(1, 'rgba(254, 112, 150, 1)');

  let gradientStrokeViolet = ctx.createLinearGradient(0, 0, 0, 181);
  gradientStrokeViolet.addColorStop(0, 'rgba(218, 140, 255, 1)');
  gradientStrokeViolet.addColorStop(1, 'rgba(154, 85, 255, 1)');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: xlabel,
      datasets: [
        {
          label: "Income",
          backgroundColor: gradientStrokeBlue,
          data: dataIncome,
        }, {
          label: "Spending",
          backgroundColor: gradientStrokeRed,
          data: dataSpending,
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Report'
      },
      scales: {
        yAxes: [{
            ticks: {
                beginAtZero: true,
                callback: function(value) {
                  return '$ ' + value;
              }
            },
        }]
      }
    }
  });
}

async function getData() {
  const response = await fetch('http://localhost:8080/model/api-admin/report/findall');
  const data = await response.json();
  for (let i = 0; i < data.length; i++) {
    let date = data[i].month + "/" + data[i].year
    xlabel.push(date);
    dataIncome.push(parseFloat(data[i].income));
    dataSpending.push(parseFloat(data[i].spending));
  }
}

chartIt();

async function getDataReport() {
  const response = await fetch('http://localhost:8080/model/api-admin/report/findall');
  const data = await response.json();
  for (let i = 0; i < data.length; i++) {
    let date = data[i].month + "/" + data[i].year
    xlabel.push(date);
    dataIncomeReport.push(parseFloat(data[i].income));
    dataSpendingReport.push(parseFloat(data[i].spending));
  }
}

async function reportIt() {

  await getDataReport();

  let data = [];
  
  let sumDataIncome = 0;
  let sumDataSpending = 0;

  for (let i = 0; i < dataIncomeReport.length; i++) {
    sumDataIncome += dataIncomeReport[i];
  }

  for (let i = 0; i < dataSpendingReport.length; i++) {
    sumDataSpending += dataSpendingReport[i];
  }

  data.push(sumDataIncome);
  data.push(sumDataSpending);

  let ctx = document.getElementById('pie-chart').getContext("2d");

  let gradientStrokeBlue = ctx.createLinearGradient(0, 0, 0, 360);
  gradientStrokeBlue.addColorStop(0, 'rgba(54, 215, 232, 1)');
  gradientStrokeBlue.addColorStop(1, 'rgba(177, 148, 250, 1)');

  let gradientStrokeRed = ctx.createLinearGradient(0, 0, 0, 300);
  gradientStrokeRed.addColorStop(0, 'rgba(255, 191, 150, 1)');
  gradientStrokeRed.addColorStop(1, 'rgba(254, 112, 150, 1)');

  let gradientStrokeViolet = ctx.createLinearGradient(0, 0, 0, 181);
  gradientStrokeViolet.addColorStop(0, 'rgba(218, 140, 255, 1)');
  gradientStrokeViolet.addColorStop(1, 'rgba(154, 85, 255, 1)');


  new Chart(ctx, {

    type: 'pie',
    data: {
      labels: ["Income", "Spending"],
      datasets: [{
        label: "Population (millions)",
        backgroundColor: [gradientStrokeBlue, gradientStrokeRed],
        data: data
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Report'
      }
    }
  });

}

reportIt();