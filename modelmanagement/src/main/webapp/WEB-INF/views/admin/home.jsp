<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management</title>
</head>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0 text-dark">Admin</h1>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Report</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->
		<div class="content">
			
			<div style="display: flex; justify-content: space-between;">
				<div style="width: 800px; height: 450px; background: white;">
					<canvas id="bar-chart-grouped" width="800" height="450"></canvas>
				</div>
				
				<div style="width: 800px; height: 450px; background: white;">
	       			 <canvas id="pie-chart" width="800" height="450"></canvas>
	    		</div>
			</div>	
		</div>
		
		
            <div class="row" id="proBanner">
              <div class="col-12">
                <span class="d-flex align-items-center purchase-popup">
                  <a href="https://www.bootstrapdash.com/product/purple-bootstrap-admin-template?utm_source=organic&amp;utm_medium=banner&amp;utm_campaign=free-preview" target="_blank" class="btn download-button purchase-button ml-auto"></a>
                  <i class="mdi mdi-close" id="bannerClose"></i>
                </span>
              </div>
            </div>
            <div class="page-header">
              <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white mr-2">
                  <i class="mdi mdi-home"></i>
                </span></h3>
              <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                  <li class="breadcrumb-item active" aria-current="page">
                    <span></span> <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                  </li>
                </ul>
              </nav>
            </div>
            <div class="row">
              <div class="col-md-6 stretch-card grid-margin">
                <div class="card bg-gradient-danger card-img-holder text-white">
                  <div class="card-body">
                    <h4 class="font-weight-normal mb-3">Weekly Sales <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">${reportWeek.getWeekSales() }</h2>
                    <c:choose>
                    	<c:when test="${reportWeek.getCompareSales() >=0 }">
                    		<h6 class="card-text">Increased by ${reportWeek.getCompareSales() } %</h6>
                    	</c:when>
                    	<c:when test="${reportWeek.getCompareSales()<0 }">
                    		 <h6 class="card-text">Decreased by ${reportWeek.getCompareSales() * -1 } %</h6>
                    	</c:when>
                    </c:choose>
                  </div>
                </div>
              </div>
              <div class="col-md-6 stretch-card grid-margin">
                <div class="card bg-gradient-info card-img-holder text-white">
                  <div class="card-body">
                    <h4 class="font-weight-normal mb-3">Weekly Orders <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">${reportWeek.getWeekOrders() }</h2>
                    <c:choose>
                    	<c:when test="${reportWeek.getCompareOrders()>=0 }">
                    		<h6 class="card-text">Increased by ${reportWeek.getCompareOrders() } %</h6>
                    	</c:when>
                    	<c:when test="${reportWeek.getCompareOrders()<0 }">
                    		 <h6 class="card-text">Decreased by ${reportWeek.getCompareOrders() * -1 } %</h6>
                    	</c:when>
                    </c:choose>
                  </div>
                </div>
              </div>
            </div>
           
          
		
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
	<script src="resources/private/admin/home/js/index.js"></script>
</body>
</html>