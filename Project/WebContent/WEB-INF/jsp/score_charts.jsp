<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Teaching and Marking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- bootstrap 4.1.0 css -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <!-- jQuery 3.2.1 -->
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <!-- poper.min.js -->
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <!-- bootstrap 4.1.0 javascript -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <!-- font-awesome.css -->
    <link href="../../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- system main css -->
    <link href="../../assets/css/main_style.css" rel="stylesheet" />
    <!-- Charts -->
    <script src="../../assets/js/Chart.min.js"></script>
    <script type="text/javascript" src="../../assets/js/echarts.common.min.js"></script>
    <script type="text/javascript" src="../../assets/js/main.js"></script>
  </head>

  <body>
    <div class="wrapper">
        <!-- top navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top top-navbar">
          <button type="button" id="toggler" name="button"><i class="fa fa-align-left"></i></button>
          <a class="navbar-brand" href="/dashboard/dashboardUI"><span>Teaching and Marking System</span></a>
          <!-- navbar toggler -->
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <!-- navbar content -->
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- navbar user -->
            <ul class="navbar-nav ml-auto">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fa fa-user"><span>Hello, ${lecturer.lecturerName }</span></i>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="/user/logout">Logout</a>
                </div>
              </li>
            </ul>
          </div>
        </nav>

        <!--  page -->
        <div class="row" id="page">
          <!-- sidebar -->
          <nav id="sidebar" class="bg-light navbar-light col-xs-2 col-sm-2 col-md-2 col-lg-2 visible">
            <ul class="list-unstyled">
                <li class="nav-item">
                  <a class="nav-link" href="/dashboard/dashboardUI"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/lesson/lessonlist"><i class="fa fa-book"></i><span>Subject Information</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#markerSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-user"></i><span>Marker Information</span></a>
                  <ul class="collapse list-unstyled" id="markerSubmenu">
                    <li>
                      <a class="nav-link" href="/tutor/tutor_invite_list"><span>Marker Invitation</span></a>
                    </li>
                    <li>
                      <a class="nav-link" href="/tutor/overview"><span>Marker Overview</span></a>
                    </li>
                  </ul>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/assign/list"><i class="fa fa-tasks"></i><span>Marking Allocation</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/mark/list"><i class="fa fa-file"></i><span>Scores & Results</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="/mark/showChart"><i class="fa fa-bar-chart-o"></i><span>Score Charts</span></a>
                </li>
              </ul>
          </nav>

          <!-- page content -->
          <div class="page-content col-xs-10 col-sm-10 col-md-10 col-lg-10">
            <!-- breadcrumb -->
            <ol class="breadcrumb row">
              <li class="breadcrumb-item"><a href="/dashboard/dashboardUI">Home</a></li>
              <li class="breadcrumb-item active">Score Charts</li>
            </ol>
            <!-- page -->
            <div class="row">
              <form class="" action="showChart" method="post" id="showChart_id">
                <div class="row charts_selection">
                  <div class="col-lg-4">
                    <label for="subject"><span class="badge badge-secondary check_subject"></span> Subject:</label>
                    <br>
                    <input type="text" class="showTooltip" id="subject_info" name="subject" list="subject" autocomplete="off" autofocus>
                    <datalist id="subject">
                      <c:forEach items="${lessons }" var="lesson">
                        <option value="${lesson.classDict.classId } ${lesson.semester } ${lesson.year}" data-id="${lesson.lessonId }"></option>
                      
                      </c:forEach>
                    </datalist>
                    <input type="hidden" name="lessonId" id="answer-hidden">
                  </div>
                  <div class="col-lg-3">
                    <label for="assignment"><span class="badge badge-secondary check_assignment"></span> Assignment:</label>
                    <br>
                    <input type="text" class="showTooltip" id="assignment_info" name="assignment" list="assignment" autocomplete="off" placeholder=" Can Be None">
                    <datalist id="assignment">
                      <option value="1"></option>
                      <option value="2"></option>
                      <option value="3"></option>
                      <option value="4"></option>
                      <option value="5"></option>
                    </datalist>
                  </div>
                  <div class="col-lg-2">
                    <label>Operation:</label><br>
                    <button type="button" class="button" id="generate" name="button">Generate Charts</button>
                  </div>
                  <div class="col-lg-1">
                    <label>TOTAL NUMBER of STUDENTS:</label>
                    <label>${number }</label>
                  </div>
                </div>
              </form>
            </div>
            <div class="row charts">
              <div style="height:300px;width:50%;" class="line_chart">
                  <canvas id="chartjs-line-chart"></canvas>
              </div>
              <div style="height:300px;width:50%;" class="doughnut_chart">
                  <canvas id="chartjs-doughnut-chart"></canvas>
              </div>
            </div>
            <div class="row">
              <div class="bar_chart">
                <div id="container" style=" width: 600px;height: 300px;"></div>
                <p id="chart_title">Bar Chart</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      	<!-- alert -->
		<div class="alert alert-warning alert-dismissible fade show warning"
			hidden>
			<button type="button" class="close" data-dismiss="alert"
				style="margin: 10px; padding: 0">&times;</button>
			<strong>Warning!</strong>&nbsp;<span id="warning"></span>
		</div>
		<!-- alert -->
		<div class="alert alert-danger alert-dismissible fade show error"
			hidden>
			<button type="button" class="close" data-dismiss="alert"
				style="margin: 10px; padding: 0">&times;</button>
			<strong>Error!</strong>&nbsp;<span id="error"></span>
		</div>
		<!-- alert -->
		<div class="alert alert-success alert-dismissible fade show success"
			hidden>
			<button type="button" class="close" data-dismiss="alert"
				style="margin: 10px; padding: 0">&times;</button>
			<strong>Success!</strong>&nbsp;<span id="success"></span>
		</div>
      
      <script>
      (function ($) {
          window.chartColors = {
              red: 'rgb(255, 99, 132)',
              orange: 'rgb(255, 159, 64)',
              yellow: 'rgb(255, 205, 86)',
              green: 'rgb(75, 192, 192)',
              blue: 'rgb(54, 162, 235)',
              purple: 'rgb(153, 102, 255)',
              grey: 'rgb(201, 203, 207)'
          };

          window.randomScalingFactor = function () {
              return (Math.random() > 0.5 ? 1.0 : -1.0) * Math.round(Math.random() * 100);
          };

          var lineConfig = {
              type: 'line',
              data: {
                  labels: ["H1", "H2A", "H2B", "H3", "P", "N", "Others"],
                  datasets: [
               	  <c:forEach items="${numbers}" var="numberArray" varStatus = "listIndex">
                  {
                      label: "Assignment${assignList[listIndex.index]}",
                      backgroundColor: window.chartColors.red,
                      borderColor: window.chartColors.red,
                      data: [
                          ${numberArray[0]},
                          ${numberArray[1]},
                          ${numberArray[2]},
                          ${numberArray[3]},
                          ${numberArray[4]},
                          ${numberArray[5]},
                          ${numberArray[6]}
                      ],
                      fill: false,
                  },
                  </c:forEach>
                  ]
              },
              options: {
                  responsive: true,
                  maintainAspectRatio: false,
                  title: {
                      display: true,
                      text: 'Line Chart'
                  },
                  tooltips: {
                      mode: 'index',
                      intersect: false,
                  },
                  hover: {
                      mode: 'nearest',
                      intersect: true
                  },
                  scales: {
                      xAxes: [{
                          display: true,
                          scaleLabel: {
                              display: true,
                              labelString: 'Grade and Mark Category'
                          }
                      }],
                      yAxes: [{
                          display: true,
                          scaleLabel: {
                              display: true,
                              labelString: 'Number of Students'
                          }
                      }]
                  }
              }
          };
          var lineCtx = document.getElementById("chartjs-line-chart").getContext("2d");
          window.myLine = new Chart(lineCtx, lineConfig);
      } (jQuery));
      </script>

      <script>
          window.chartColors = {
              red: 'rgb(255, 99, 132)',
              orange: 'rgb(255, 159, 64)',
              yellow: 'rgb(255, 205, 86)',
              green: 'rgb(75, 192, 192)',
              blue: 'rgb(54, 162, 235)',
              purple: 'rgb(153, 102, 255)',
              grey: 'rgb(201, 203, 207)'
          };

          window.randomScalingFactor = function () {
              return (Math.random() > 0.5 ? 1.0 : -1.0) * Math.round(Math.random() * 100);
          };

          var doughnutConfig = {
              type: 'doughnut',
              data: {
                  datasets: [{
                      data: [
                          ${combined[0]}, ${combined[1]}, ${combined[2]}, ${combined[3]}, ${combined[4]},${combined[5]},${combined[6]}
                      ],
                      backgroundColor: [
                          window.chartColors.red,
                          window.chartColors.orange,
                          window.chartColors.yellow,
                          window.chartColors.green,
                          window.chartColors.blue,
                          window.chartColors.purple,
                          window.chartColors.grey,
                      ],
                      label: ''
                  }],
                  labels: [
                      "H1 80%-100%",
                      "H2A 75%-79%",
                      "H2B 70%-74%",
                      "H3 65%-69%",
                      "P 50%-64%",
                      "N 0-49%",
                      "Others"
                  ]
              },
              options: {
                  responsive: true,
                  maintainAspectRatio: false,
                  title: {
                      display: true,
                      text: 'Pie Chart'
                  }
              }
          };


          var doughnutCtx = document.getElementById("chartjs-doughnut-chart").getContext("2d");
          window.myDoughnut = new Chart(doughnutCtx, doughnutConfig);
      </script>

      <script type="text/javascript">
          var dom = document.getElementById("container");
          var myChart = echarts.init(dom);
          var app = {};
          option = null;
          app.title = 'Bar Chart';

          var namedate = ['H1', 'H2A', 'H2B', 'H3', 'P', 'N', 'Others'];
          var numdate = [${combined[0]}, ${combined[1]}, ${combined[2]}, ${combined[3]}, ${combined[4]},${combined[5]},${combined[6]}];
          var colorlist = [];
          numdate.forEach(element => {
            if (element < 60) {
              colorlist.push(["#fc7095", "#fa8466"])
            } else if (element >= 60 && element < 90) {
              colorlist.push(["#386ffd", "#74b3ff"])
            } else {
  			      colorlist.push(["#1aa8ce", "#49d3c6"])
          }});
          option = {
              tooltip: {
                  trigger: 'axis',
                  axisPointer: {
                      type: 'shadow'
                  }
              },
              grid: {
                  left: '1%',
                  right: '1%',
                  bottom: '1%',
                  containLabel: true
              },
              xAxis: [
                  {
                      type: 'category',
                      data: namedate,
                      axisTick: {
                          alignWithLabel: true
                      },
                      axisLine: {
                          lineStyle: {
                              color: "#4dd1c4",
                              width: 1
                          }
                      },
                      axisLabel: {
                          show: true,
                          textStyle: {
                              color: '#999'
                          }
                      }
                  }
              ],
              yAxis: [
                  {
                      type: 'value',
                      axisLabel: {
                          formatter: '{value}',
                          show: true,
                          textStyle: {
                              color: '#999'
                          }
                      },
                      axisLine: {
                          lineStyle: {
                              color: "#4dd1c4",
                              width: 1
                          }
                      },
                      splitLine: {
                          show: true,
                          lineStyle: {
                              type: 'dashed',
                              color: '#ddd'
                          }
                      }

                  }
              ],
              series: [
                  {
                      name: 'Number of Students',
                      type: 'bar',
                      barWidth: '60%',
                      data: numdate,
                      itemStyle: {
                          normal: {
                              color: function (params) {
                                  var colorList = colorlist
                                  var index = params.dataIndex;
                                  return new echarts.graphic.LinearGradient(0, 0, 0, 1,
                                      [
                                          { offset: 1, color: colorList[index][0] },
                                          { offset: 0, color: colorList[index][1] }
                                      ]);
                              }
                          }
                      }
                  }
              ]
          };
          ;
          if (option && typeof option === "object") {
              myChart.setOption(option, true);
          }
      </script>

      <script type="text/javascript">
      $(document).ready(function () {
        $('input[list]').on('input', function(e) {
            var $input = $('#subject_info'),
                $options = $('#' + $input.attr('list') + ' option'),
                $hiddenInput = $('#answer-hidden'),
                label = $input.val();

            for(var i = 0; i < $options.length; i++) {
                var $option = $options.eq(i);
                if($option.val() === label) {
                    $hiddenInput.val( $option.attr('data-id') );
                    console.log($hiddenInput.val());
                    break;
                }
            }
        });

        var flag1 = false;
        var flag2 = false;

        $('#subject_info').on("blur",function(){
            flag1 = false;
            var options=$("#subject").prop("options");
            for(var i=0;i<options.length;i++){
              var text = options[i].value;
              if(text==$('#subject_info').val()){
                $('.check_subject').removeClass("badge-danger");
                $('.check_subject').addClass("badge-success");
                $('.check_subject').html("Valid");
                $('#generate').addClass("flag1");
                flag1 = true;
                break;
              }
            }
            if(!flag1){
              $('.check_subject').removeClass("badge-success");
              $('.check_subject').addClass("badge-danger");
              $('.check_subject').html("Invalid");
              $('#generate').addClass("disabled");
              $('#generate').removeClass("flag1");
            }
            else if(($('#generate').hasClass("flag1") && $('#generate').hasClass("flag2"))  || ($('#generate').hasClass("flag1") && $('#assignment_info').val().trim()=="")){
              $('#generate').removeClass("disabled");
            }
            console.log($('#generate').hasClass("disabled"));
          });

        $('#assignment_info').on("blur", function(){
            flag2 = false;
            var options=$("#assignment").prop("options");
            for(var i=0;i<options.length;i++){
              var text = options[i].value;
              if(text==$('#assignment_info').val() || $('#assignment_info').val().trim()==""){
                $('.check_assignment').removeClass("badge-danger");
                $('.check_assignment').addClass("badge-success");
                $('.check_assignment').html("Valid");
                $('#generate').addClass("flag2");
                flag2 = true;
                break;
              }
            }
            if(!flag2){
              $('.check_assignment').removeClass("badge-success");
              $('.check_assignment').addClass("badge-danger");
              $('.check_assignment').html("Invalid");
              $('#generate').addClass("disabled");
              $('#generate').removeClass("flag2");
            }
            else if($('#generate').hasClass("flag1") && $('#generate').hasClass("flag2")){
              $('#generate').removeClass("disabled");
            }
            console.log($('#generate').hasClass("disabled"));
          });
        
        $("#generate").click(function(){
        	if(flag1==true && flag2==true){
        		$("#showChart_id").submit();
        	}else if(flag1==false){
             	 $('#warning').text("Please input a valid Subject!");
      	         $('.warning').removeAttr("hidden");
      	         setTimeout(function(){
      	            $('.warning').attr("hidden", true);
      	         }, 5000);
        	}else if(flag2==false && flag1==true){
        		if($('#assignment_info').val().trim()!=""){
                 	 $('#warning').text("Please input a valid Assignment!");
          	         $('.warning').removeAttr("hidden");
          	         setTimeout(function(){
          	            $('.warning').attr("hidden", true);
          	         }, 5000);
        		}else{
        			$("#showChart_id").submit();
          	   	}
           	}
        });
      });
      </script>

  </body>
</html>
