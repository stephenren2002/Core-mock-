var myData = new Array(['Sector 1', 2], ['Sector 2', 1], ['Sector 3', 3], ['Sector 4', 6], ['Sector 5', 8.5], ['Sector 6', 10]);
var colors = ['#FACC00', '#FB9900', '#FB6600', '#FB4800', '#CB0A0A', '#F8F933'];
var myChart = new JSChart('chartid', 'pie');
myChart.setDataArray(myData);
myChart.colorizePie(colors);
myChart.setTitleColor('#857D7D');
myChart.setPieUnitsColor('#9B9B9B');
myChart.setPieValuesColor('#6A0000');
myChart.draw();