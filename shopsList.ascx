<%@ Control Language="C#" AutoEventWireup="true" CodeFile="shopsList.ascx.cs" Inherits="sidetab1_shopsList" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<div id="canvas-holder" style="width:100%">
		<canvas id="myChart"></canvas>
	</div>


<script>

$(function(){

  //get the pie chart canvas
  var ctx = $("#myChart");

  //pie chart data
  var data1 = {
    labels: ["match1", "match2", "match3", "match4", "match5"],
    datasets: [
      {
        data: [10, 50, 25, 70, 40],
        backgroundColor: [
          "#DEB887",
          "#A9A9A9",
          "#DC143C",
          "#F4A460",
          "#2E8B57"
        ]
      }
    ]
  };

  //options
  var options = {
    responsive: true,
    title: {
      display: false
    },
    legend: {
      display: true,
      position: "bottom",
      labels: {
        fontColor: "#333",
        fontSize: 16
      }
    }
  };

  //create Chart class object
  var chart1 = new Chart(ctx, {
    type: "pie",
    data: data1,
    options: options
  });

});

</script>